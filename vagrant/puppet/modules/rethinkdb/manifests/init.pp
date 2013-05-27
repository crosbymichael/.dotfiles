class rethinkdb (
    $rethinkdb_user = 'rethinkdb',
    $rethinkdb_group = 'rethinkdb',
    $instance_name = 'default',
    $driver_port = 28015,
    $http_port = 8080,
    $cluster_port = 29015,
    $rethinkdb_bind = 'all',
    $rethinkdb_join = undef
) inherits rethinkdb::params {
    include stdlib

    if !is_integer($driver_port) {
        fail('driver_port must be an integer')
    }
    if !is_integer($http_port) {
        fail('http_port must be an integer')
    }
    if !is_integer($cluster_port) {
        fail('cluster_port must be an integer')
    }
    if !is_string($rethinkdb_user) {
        fail('rethinkdb_user must be a string')
    }
    if !is_string($rethinkdb_group) {
        fail('rethinkdb_group must be a string')
    }
    if !is_string($rethinkdb_conf) {
        fail('rethinkdb_conf must be a string')
    }
    if !is_string($rethinkdb_bind) {
        fail('rethinkdb_bind must be a string')
    }

    case $::operatingsystem {
        'Ubuntu': {
            include 'apt'
            apt::ppa { 'ppa:rethinkdb/ppa': 
                before => Anchor['rethinkdb::repo']
            }
        }
        default: {
            fail("Class rethinkdb does not support ${::operatingsystem}")
        }
    }

    anchor { 'rethinkdb::repo': }

    package { 'rethinkdb':
        name => $rethinkdb::params::package,
        ensure => present,
        require => Anchor['rethinkdb::repo']
    }

    group { $rethinkdb_group:
        ensure => present,
        name => $rethinkdb_group,
        require => Package['rethinkdb']
    }
    
    user { $rethinkdb_user:
        comment => 'RethinkDB',
        ensure => present,
        gid => $rethinkdb_group,
        system => true,
        require => Group[$rethinkdb_group]
    }

    $conf_file = "${conf_dir}/${instance_name}.conf"
    $instances_dir = "${rethinkdb::params::instances_dir}/${instance_name}"
    $pid_file = "${rethinkdb::params::pid_basedir}/${rethinkdb::params::pid_dirname}/${instance_name}.pid"
    file { $conf_file:
        ensure => file,
        group => $rethinkdb_group,
        owner => $rethinkdb_user,
        mode => 0644,
        content => template('rethinkdb/default.conf.erb'),
        require => User[$rethinkdb_user]
    }

    # per rethinkdb docs, it's recommended to create the
    # instances directory manually via the rethinkdb command
    exec { 'create-instances-dir':
        command => "${rethinkdb::params::rethinkdb_bin} create -d ${instances_dir} && chown -R ${rethinkdb_user}:${rethinkdb_group} ${rethinkdb::params::instances_dir}/",
        creates => $instances_dir,
        require => File[$conf_file],
    }

    # make sure the rethinkdb user can create pid files
    file { $rethinkdb::params::pid_basedir:
        ensure => directory,
        recurse => true,
        owner   => $rethinkdb_user,
        group   => $rethinkdb_group,
        mode    => 0755,
        require => Exec['create-instances-dir'],
    }

    $pid_dir = "${rethinkdb::params::pid_basedir}/${rethinkdb::params::pid_dirname}" 
    file { $pid_dir:
        ensure  => directory,
        recurse => true,
        owner   => $rethinkdb_user,
        group   => $rethinkdb_group,
        mode    => 0755,
        require => File[$rethinkdb::params::pid_basedir]
    }

    service { 'rethinkdb':
        ensure => running,
        enable => true,
        provider => $rethinkdb::params::service_provider,
        name => $rethinkdb::params::service_name,
        require => File[$pid_dir],
        subscribe => File[$conf_file],
    }
}
