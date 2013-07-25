node default {

    group { "puppet":
        ensure => "present"
    }

    include "devel"
    include "golang"
    include "docker"
}
