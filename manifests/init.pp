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
  $service_name       = $::keepalived::params::service_name,
) inherits keepalived::params {
  class { 'keepalived::install': } ->
  class { 'keepalived::config': } ->
  class { 'keepalived::service': } ->
  Class [ 'keepalived' ]
}

