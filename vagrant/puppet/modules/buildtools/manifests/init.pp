
class buildtools {

    Package { ensure => "installed" }

    include gcc

    package { ["bison", "gawk", "libc6-dev", "make", "automake", "build-essential",]: }
}
