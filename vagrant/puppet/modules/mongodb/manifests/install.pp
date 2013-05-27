# == Class: mongodb::install
#
#
class mongodb::install {

	anchor { 'mongodb::install::begin': }
	anchor { 'mongodb::install::end': }

	include $::mongodb::params::repo_class

	package { 'mongodb-stable':
		name   => $::mongodb::params::old_server_pkg_name,
		ensure => absent,
		require => Anchor['mongodb::install::begin'],
		before => Anchor['mongodb::install::end']
	}

	package { 'mongodb-10gen':
		name    => $::mongodb::params::server_pkg_name,
		ensure  => installed,
		require => [Anchor['mongodb::install::begin'],Class[$::mongodb::params::repo_class]],
		before => Anchor['mongodb::install::end']
	}

}
