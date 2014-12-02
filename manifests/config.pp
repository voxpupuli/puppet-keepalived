# == Class keepalived::config
#
class keepalived::config {
  File {
    ensure  => present,
    require => Class['::keepalived::install'],
    owner   => $::keepalived::config_owner,
    group   => $::keepalived::config_group,
  }

  if $::keepalived::service_manage == true {
    File {
      notify  => Service[$::keepalived::service_name],
    }
  }

  file { $::keepalived::config_dir:
    ensure => directory,
    group  => $::keepalived::config_group,
    mode   => $::keepalived::config_dir_mode,
    owner  => $::keepalived::config_owner,
  }

  concat { "${::keepalived::config_dir}/keepalived.conf":
    owner => $::keepalived::config_owner,
    group => $::keepalived::config_group,
    mode  => $::keepalived::config_file_mode,
  }

  concat::fragment { 'keepalived.conf_header':
    target  => "${::keepalived::config_dir}/keepalived.conf",
    content => "# Managed by Puppet\n",
    order   => '001',
  }

  concat::fragment { 'keepalived.conf_footer':
    target  => "${::keepalived::config_dir}/keepalived.conf",
    content => "\n",
    order   => '999',
  }
}

