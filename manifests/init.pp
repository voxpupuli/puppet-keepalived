# == Class keepalived
#
class keepalived (
  $config_dir         = $::keepalived::params::config_dir,
  $config_dir_mode    = $::keepalived::params::config_dir_mode,
  $config_file_mode   = $::keepalived::params::config_file_mode,
  $config_group       = $::keepalived::params::config_group,
  $config_owner       = $::keepalived::params::config_owner,
  $daemon_group       = $::keepalived::params::daemon_group,
  $daemon_user        = $::keepalived::params::daemon_user,
  $pkg_ensure         = $::keepalived::params::pkg_ensure,
  $pkg_list           = $::keepalived::params::pkg_list,
  $service_enable     = $::keepalived::params::service_enable,
  $service_ensure     = $::keepalived::params::service_ensure,
  $service_hasrestart = $::keepalived::params::service_hasrestart,
  $service_hasstatus  = $::keepalived::params::service_hasstatus,
  $service_manage     = $::keepalived::params::service_manage,
  $service_name       = $::keepalived::params::service_name,
  $service_restart    = $::keepalived::params::service_restart,
  $vrrp_instance      = {},
  $vrrp_script        = {},
  $vrrp_sync_group    = {},
) inherits keepalived::params {
  validate_absolute_path($config_dir)
  validate_re($config_dir_mode, '^[0-9]+$')
  validate_re($config_file_mode, '^[0-9]+$')
  validate_string($pkg_ensure)
  validate_bool($service_enable)
  validate_re($service_ensure, ['^running$','^stopped$'])
  validate_bool($service_hasrestart)
  validate_bool($service_hasstatus)
  validate_bool($service_manage)
  validate_string($service_name)
  validate_hash($vrrp_instance)
  validate_hash($vrrp_script)
  validate_hash($vrrp_sync_group)

  class { 'keepalived::install': } ->
  class { 'keepalived::config': } ->
  class { 'keepalived::service': }
}

