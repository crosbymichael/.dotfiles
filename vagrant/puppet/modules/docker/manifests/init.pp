
class docker {
    include wget
    package { ["lxc", "aufs-tools",]: }
}

