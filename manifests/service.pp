# = Class keepalived
#
class keepalived::service {
  service { $::keepalived::service_name:
    ensure    => $::keepalived::service_ensure,
    enable    => $::keepalived::service_enable,
    hasstatus => $::keepalived::service_hasstatus,
    require   => Class['::keepalived::config'];
  }
}

