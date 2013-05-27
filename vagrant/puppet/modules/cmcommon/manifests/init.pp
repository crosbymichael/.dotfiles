
class cmcommon {

    Package { ensure => "installed" }

    include wget

    package { ["curl", "git", "htop", "screen", "vim",]: }

    $vagrant_user = "vagrant"
    $vagrant_home = "/home/vagrant"

     file { "${vagrant_home}/.profile":
        mode => 644,
        owner => $vagrant_user,
        group => $vagrant_user,
        content => template("cmcommon/profile"),
    }
}
