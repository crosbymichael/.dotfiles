# Class: supervisor
#
# This module manages supervisor
#
# Parameters:
#   [*ensure*]
#     Ensure if present or absent.
#     Default: present
#
#   [*autoupgrade*]
#     Upgrade package automatically, if there is a newer version.
#     Default: false
#
#   [*service_ensure*]
#     Ensure if service is running or stopped.
#     Default: running
#
#   [*service_enable*]
#     Start service at boot.
#     Default: true
#
#   [*enable_inet_server*]
#     Enable inet_http_server.
#     Default: false
#
#   [*inet_server_port*]
#     inet_http_server ip:port to listen on.
#     Only used if inet_http_server is set to true.
#     Default: *:9000
#
#   [*inet_server_user*]
#     If set, this is the name of the user to authenticate as.
#     Only used if inet_http_server is set to true.
#     Default: undef
#
#   [*inet_server_password*]
#     Password for the inet_http_server.
#     Only used if inet_http_server is set to true and inet_server_user is set.
#     Default: undef
#
#   [*logfile*]
#     Main log file.
#     Default: /var/log/supervisor/supervisord.log
#
#   [*logfile_maxbytes*]
#     The maximum number of bytes that may be consumed by the activity log
#     file before it is rotated.
#     Default: 500MB
#
#   [*logfile_backups*]
#     The number of backups to keep around resulting from activity log
#     file rotation.
#     Default: 10
#
#   [*minfds*]
#     The minimum number of file descriptors that must be available before
#     supervisord will start successfully.
#     Default: 1024
#
#   [*minprocs*]
#     The minimum number of process descriptors that must be available before
#     supervisord will start successfully.
#     Default: 200
#
#   [*childlogdir*]
#     The directory used for AUTO child log files.
#     Default: /var/log/supervisor
#
#   [*user*]
#     If supervisord is run as the root user, switch users to this UNIX user
#     account before doing any meaningful processing.
#     Default: undef
#
#   [*umask*]
#     The umask of the supervisord process.
#     Default: 022
#
#   [*supervisor_environment*]
#     A list of key/value pairs in the form KEY=val,KEY2=val2 that will be
#     placed in the supervisord process’ environment.
#     Default: undef
#
#   [*identifier*]
#     The identifier string for this supervisor process,
#     used by the RPC interface.
#     Default: undef
#
#   [*recurse_config_dir*]
#     Remove unmanaged files from config directory.
#     Default: false
#
# Actions:
#   Installs supervisor.
#
# Sample Usage:
#   class { 'supervisor': }
#
# Notes:
#   You should always invoke the supervisor::service definition instead. Check that readme.
#
class supervisor(
  $ensure                   = 'present',
  $autoupgrade              = false,
  $service_ensure           = 'running',
  $service_enable           = true,
  $enable_inet_server       = false,
  $inet_server_port         = '*:9000',
  $inet_server_user         = undef,
  $inet_server_pass         = undef,
  $logfile                  = '/var/log/supervisor/supervisord.log',
  $logfile_maxbytes         = '500MB',
  $logfile_backups          = 10,
  $log_level                = 'info',
  $minfds                   = 1024,
  $minprocs                 = 200,
  $childlogdir              = '/var/log/supervisor',
  $nocleanup                = false,
  $user                     = undef,
  $umask                    = '022',
  $supervisor_environment   = undef,
  $identifier               = undef,
  $recurse_config_dir       = false
) inherits supervisor::params {

  include supervisor::update

  case $ensure {
    present: {
      if $autoupgrade == true {
        $package_ensure = 'latest'
      } else {
        $package_ensure = 'present'
      }

      case $service_ensure {
        running, stopped: {
          $service_ensure_real = $service_ensure
        }
        default: {
          fail('service_ensure parameter must be running or stopped')
        }
      }

      $dir_ensure = 'directory'
      $file_ensure = 'file'
    }
    absent: {
      $package_ensure = 'absent'
      $service_ensure_real = 'stopped'
      $dir_ensure = 'absent'
      $file_ensure = 'absent'
    }
    default: {
      fail('ensure parameter must be present or absent')
    }
  }

  if ! defined(Package[$supervisor::params::package]) {
    package { $supervisor::params::package:
      ensure => $package_ensure,
    }
  }

  file { $supervisor::params::conf_dir:
    ensure  => $dir_ensure,
    purge   => true,
    recurse => $recurse_config_dir,
    require => Package[$supervisor::params::package],
  }

  file { [
    '/var/log/supervisor',
    '/var/run/supervisor'
  ]:
    ensure  => $dir_ensure,
    purge   => true,
    backup  => false,
    require => Package[$supervisor::params::package],
  }

  file { $supervisor::params::conf_file:
    ensure  => $file_ensure,
    content => template('supervisor/supervisord.conf.erb'),
    require => File[$supervisor::params::conf_dir],
    notify  => Service[$supervisor::params::system_service],
  }

  file { '/etc/logrotate.d/supervisor':
    ensure  => $file_ensure,
    source  => 'puppet:///modules/supervisor/logrotate',
    require => Package[$supervisor::params::package],
  }

  service { $supervisor::params::system_service:
    ensure     => $service_ensure_real,
    enable     => $service_enable,
    hasrestart => true,
    require    => File[$supervisor::params::conf_file],
  }
}
