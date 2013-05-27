Puppet module for configuring the 'supervisor' daemon control
utility. Currently tested on Debian, Ubuntu, and Fedora.

Install into `module_path>/supervisor`

Example usage::

  include supervisor

  supervisor::service {
    'scribe':
      ensure      => present,
      enable      => true,
      command     => '/usr/bin/scribed -c /etc/scribe/scribe.conf',
      environment => 'HADOOP_HOME=/usr/lib/hadoop,LD_LIBRARY_PATH=/usr/lib/jvm/java-6-sun/jre/lib/amd64/server',
      user        => 'scribe',
      group       => 'scribe',
      require     => [ Package['scribe'], User['scribe'] ];
  }
