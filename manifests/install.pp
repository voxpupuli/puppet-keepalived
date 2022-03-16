# @summary
#   Install keepalived package
#
class keepalived::install {
  if $keepalived::manage_package {
    package { $keepalived::pkg_list:
      ensure => $keepalived::pkg_ensure,
    }
  }
}
