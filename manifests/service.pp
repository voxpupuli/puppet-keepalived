# == Class keepalived
#
class keepalived::service {

  if $::keepalived::service_manage == true {
    service { $::keepalived::service_name:
      ensure     => $::keepalived::service_ensure,
      enable     => $::keepalived::service_enable,
      hasrestart => $::keepalived::service_hasrestart,
      hasstatus  => $::keepalived::service_hasstatus,
      require    => Class['::keepalived::config'],
      restart    => $::keepalived::service_restart,
    }
  }
}

