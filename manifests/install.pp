# @summary
#   Install keepalived package
#
class keepalived::install {
  package { $keepalived::pkg_list:
    ensure => $keepalived::pkg_ensure,
  }
}
