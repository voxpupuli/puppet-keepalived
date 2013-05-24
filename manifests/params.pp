# == Class keepalived::params
#
class keepalived::params {
  case $::osfamily {
    'redhat': {
      $config_dir         = '/etc/keepalived'
      $config_group       = 'root'
      $config_dir_mode    = '0755'
      $config_mode        = '0644'
      $config_user        = 'root'
      $daemon_group       = 'root'
      $daemon_user        = 'root'
      $log_dir            = ''
      $pid_file           = '/var/run/keepalived.pid'
      $pkg_ensure         = present
      $pkg_list           = [ 'keepalived' ]
      $service_enable     = true
      $service_ensure     = running
      $service_hasstatus  = true
      $service_hasrestart = true
      $service_name       = 'keepalived'
    }

    'debian': {
      $config_dir         = '/etc/keepalived'
      $config_dir_mode    = '0755'
      $config_file_mode   = '0644'
      $config_group       = 'root'
      $config_user        = 'root'
      $daemon_group       = 'root'
      $daemon_user        = 'root'
      $log_dir            = ''
      $pid_file           = '/var/run/keepalived.pid'
      $pkg_ensure         = present
      $pkg_list           = [ 'keepalived' ]
      $service_enable     = true
      $service_ensure     = running
      $service_hasrestart = false
      $service_hasstatus  = false
      $service_name       = 'keepalived'
    }

    default: {
      fail "Operating system ${::operatingsystem} is not supported."
    }
  }
}

