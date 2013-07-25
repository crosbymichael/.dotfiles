
class devel {
    Package { ensure => "installed" }

    include wget
    include buildtools

    package { ["curl", "git-core", "htop", "tmux", "vim", "ctags",]: }

    $vagrant_user = "vagrant"
    $vagrant_home = "/home/vagrant"

     file { "${vagrant_home}/.profile":
        mode => 644,
        owner => $vagrant_user,
        group => $vagrant_user,
        content => template("devel/profile"),
    }
}
