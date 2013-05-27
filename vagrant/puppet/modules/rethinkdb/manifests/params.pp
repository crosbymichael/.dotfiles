class rethinkdb::params {
    case $::operatingsystem {
        'Ubuntu': {
            $package = 'rethinkdb'
            $instances_dir = '/var/lib/rethinkdb/instances.d'
            $pid_basedir = '/var/run/rethinkdb'
            $pid_dirname = 'instances.d'
            $service_provider = 'init'
            $service_name = 'rethinkdb'
            $conf_dir = '/etc/rethinkdb/instances.d'
            $rethinkdb_bin = '/usr/bin/rethinkdb'
        }
        default: {
            fail("Class rethinkdb does not support ${::operatingsystem}")
        }
    }
}
