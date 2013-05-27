node default {

    group { "puppet":
        ensure => "present"
    }

    include "cmcommon"
}
