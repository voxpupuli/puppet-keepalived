# = Class keepalived::config
#
class keepalived::config {
  File {
    ensure  => present,
    require => Class['::keepalived::install'],
    notify  => Service[$::keepalived::service_name],
    owner   => $::keepalived::config_user,
    group   => $::keepalived::config_group,
  }

  file { $::keepalived::config_dir:
    ensure => directory;
  }

  concat { "${::keepalived::config_dir}/keepalived.conf":
    owner => $::keepalived::config_user,
    group => $::keepalived::config_group,
    mode  => $::keepalived::config_mode,
  }

  concat::fragment { 'keepalived.conf_header':
    target  => "${::keepalived::config_dir}/keepalived.conf",
    content => "# Managed by Puppet\n",
    order   => 01,
  }

  concat::fragment { 'keepalived.conf_footer':
    target  => "${::keepalived::config_dir}/keepalived.conf",
    content => "\n",
    order   => 999,
  }
}

