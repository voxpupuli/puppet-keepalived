# == Class keepalived::params
#
class keepalived::params {

  $pkg_ensure      = 'present'
  $service_enable  = true
  $service_ensure  = 'running'
  $service_manage  = true
  $service_restart = undef

  case $facts['osfamily'] {
    'redhat': {
      $sysconf_dir        = 'sysconfig'
      $sysconf_options    = '-D'
      $config_dir         = '/etc/keepalived'
      $config_dir_mode    = '0755'
      $config_file_mode   = '0644'
      $config_group       = 'root'
      $config_owner       = 'root'
      $daemon_group       = 'root'
      $daemon_user        = 'root'
      $pkg_list           = [ 'keepalived' ]
      $service_hasstatus  = true
      $service_hasrestart = true
      $service_name       = 'keepalived'
    }

    'debian': {
      $sysconf_dir        = 'default'
      $sysconf_options    = ''
      $config_dir         = '/etc/keepalived'
      $config_dir_mode    = '0755'
      $config_file_mode   = '0644'
      $config_group       = 'root'
      $config_owner       = 'root'
      $daemon_group       = 'root'
      $daemon_user        = 'root'
      $pkg_list           = [ 'keepalived' ]
      $service_hasrestart = false
      $service_hasstatus  = false
      $service_name       = 'keepalived'
    }

    'gentoo': {
      $sysconf_dir        = 'conf.d'
      $sysconf_options    = '-D'
      $config_dir         = '/etc/keepalived'
      $config_dir_mode    = '0755'
      $config_file_mode   = '0644'
      $config_group       = 'root'
      $config_owner       = 'root'
      $daemon_group       = 'root'
      $daemon_user        = 'root'
      $pkg_list           = [ 'keepalived' ]
      $service_hasrestart = false
      $service_hasstatus  = false
      $service_name       = 'keepalived'
    }

    default: {
      fail "Operating system ${facts['operatingsystem']} is not supported."
    }
  }
}

