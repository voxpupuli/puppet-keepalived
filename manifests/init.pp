# == Class keepalived
#
class keepalived (
  Enum['sysconfig',
    'default','conf.d']    $sysconf_dir        = $::keepalived::params::sysconf_dir,
  String                   $sysconf_options    = $::keepalived::params::sysconf_options,
  Stdlib::Unixpath         $config_dir         = $::keepalived::params::config_dir,
  Stdlib::Filemode         $config_dir_mode    = $::keepalived::params::config_dir_mode,
  Stdlib::Filemode         $config_file_mode   = $::keepalived::params::config_file_mode,
  String                   $config_group       = $::keepalived::params::config_group,
  Variant[String, Integer] $config_owner       = $::keepalived::params::config_owner,
  Variant[String, Integer] $daemon_group       = $::keepalived::params::daemon_group,
  Variant[String, Integer] $daemon_user        = $::keepalived::params::daemon_user,
  String                   $pkg_ensure         = $::keepalived::params::pkg_ensure,
  Variant[String,
          Array[String]]   $pkg_list           = $::keepalived::params::pkg_list,
  Boolean                  $service_enable     = $::keepalived::params::service_enable,
  Stdlib::Ensure::Service  $service_ensure     = $::keepalived::params::service_ensure,
  Boolean                  $service_hasrestart = $::keepalived::params::service_hasrestart,
  Boolean                  $service_hasstatus  = $::keepalived::params::service_hasstatus,
  Boolean                  $service_manage     = $::keepalived::params::service_manage,
  String                   $service_name       = $::keepalived::params::service_name,
  Optional[String]         $service_restart    = $::keepalived::params::service_restart,
  Hash                     $vrrp_instance      = {},
  Hash                     $vrrp_script        = {},
  Hash                     $vrrp_sync_group    = {},
) inherits keepalived::params {

  class { 'keepalived::install': }
  -> class { 'keepalived::config': }
  -> class { 'keepalived::service': }
}

