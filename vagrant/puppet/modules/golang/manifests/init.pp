
class golang {
    $go_url = "https://go.googlecode.com/files/go1.1.1.linux-amd64.tar.gz"
    $vagrant_user = "vagrant"
    $vagrant_home = "/home/vagrant"

    exec { "fetch-go":
        require => Package["wget"],
        command => "/usr/bin/wget -O - $go_url | /bin/tar xz -C /usr/local",
        creates => "/usr/local/go/bin/go",
    }

  file { "/usr/local/go":
        owner => $vagrant_user,
        group => $vagrant_user,
        recurse => true,
    }

    file { "${vagrant_home}/gocode":
        ensure => "directory",
        owner => $vagrant_user,
        group => $vagrant_user,

    }
}

