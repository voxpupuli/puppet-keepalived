# == Class keepalived::install
#
class keepalived::install {
  package { $::keepalived::pkg_list:
    ensure => $::keepalived::pkg_ensure,
  }
}

