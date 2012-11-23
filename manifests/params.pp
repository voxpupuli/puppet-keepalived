# = Class keepalived::params
#
class keepalived::params {

  case $::operatingsystem {
    'RedHat', 'CentOS': {
      $config_dir        = ''
      $config_group      = 'root'
      $config_dir_mode   = '0755'
      $config_mode       = '0644'
      $config_user       = 'root'
      $daemon_group      = 'root'
      $daemon_user       = 'root'
      $log_dir           = ''
      $pid_file          = ''
      $pkg_ensure        = present
      $pkg_list          = ''
      $service_enable    = true
      $service_ensure    = running
      $service_hasstatus = ''
      $service_name      = ''
    }

    'Debian', 'Ubuntu': {
      $config_dir        = '/etc/keepalived'
      $config_dir_mode   = '0755'
      $config_file_mode  = '0644'
      $config_group      = 'root'
      $config_user       = 'root'
      $daemon_group      = 'root'
      $daemon_user       = 'root'
      $log_dir           = ''
      $pid_file          = '/var/run/keepalived.pid'
      $pkg_ensure        = present
      $pkg_list          = [ 'keepalived' ]
      $service_enable    = true
      $service_ensure    = running
      $service_hasstatus = false
      $service_name      = 'keepalived'
    }

    default: {
      fail "Operating system ${::operatingsystem} is not supported yet."
    }
  }

}

