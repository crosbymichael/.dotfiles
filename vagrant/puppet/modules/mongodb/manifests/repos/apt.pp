class mongodb::repos::apt {
    
  apt::source{'10gen':
    location => 'http://downloads-distro.mongodb.org/repo/debian-sysvinit',
    release => 'dist',
    repos => '10gen',
    key => '7F0CEB10',
    key_server => 'keyserver.ubuntu.com',
    include_src => false,      
  }

}
