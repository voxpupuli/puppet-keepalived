# == Define: keepalived::vrrp::instance
#
# === Parameters:
#
# $interface::             Define which interface to listen on.
#
# $priority::              Set instance priority.
#
# $state::                 Set instance state.
#                          Valid options: MASTER, BACKUP.
#
# $virtual_ipaddress_int:: Set interface for VIP to be assigned to,
#                          defaults to $interface
#
# $virtual_ipaddress::     Set floating IP address.
#
#                          May be specified as either:
#                          a) ip address (or array of IP addresses)
#                             e.g. `'10.0.0.1'`
#                          b) a hash (or array of hashes) containing
#                             extra properties
#                             e.g. `{ 'ip' => '10.0.0.1', 'label' => 'webvip' }`
#                             Supported properties: dev, brd, label, scope.
#
# $virtual_routes::        Set floating routes.
#
#                          May be specified as a hash (or array of hashes)
#                             containing extra properties
#                             e.g. `{ 'src' => '10.0.0.1',
#                                     'to' => '192.168.30.0/24',
#                                     'via' => '10.0.0.254' }`
#                             Supported properties: src, to, via, dev, scope
#
# $virtual_ipaddress_excluded:: For cases with large numbers (eg 200) of IPs
#                               on the same interface. To decrease the number
#                               of packets sent in adverts, you can exclude
#                               most IPs from adverts.
#                               Default: undef.
#
#                               May be specified as either:
#                               a) ip address (or array of IP addresses)
#                                  e.g. `'10.0.0.1'`
#                               b) a hash (or array of hashes) containing
#                                  extra properties
#                               e.g. `{ 'ip'=>'10.0.0.1', 'scope'=>'local' }`
#                               Supported properties: dev, brd, label, scope.
#
# $virtual_router_id::     Set virtual router id.
#
# $ensure::                Default: present.
#
# $auth_type::             Set authentication method.
#                          Default: undef.
#
# $auth_pass::             Authentication password.
#                          Default: undef.
#
# $track_script::          Define which script to run to track service states.
#                          Default: undef.
#
# $track_interface::       Define which interface(s) to monitor.
#                          Go to FAULT state if one of
#                          these interfaces goes down.
#                          May be specified as either:
#                            a) interface name
#                            b) array of interfaces names
#                          Default: undef.
#
# $lvs_interface::         Define lvs_sync_daemon_interface.
#                          Default: undef.
#
# $notify_script::         Script to run during ANY state transit
#                          Default: undef.
#
# $smtp_alert::            Send status alerts via SMTP. Requires user provided
#                          in SMTP settings in keepalived::global_defs class.
#                          Default: false.
#
# $nopreempt::             Allows the lower priority machine to maintain
#                          the master role, when a higher priority machine
#                          comes back online.
#                          NOTE: For this to work, the initial state of this
#                          entry must be BACKUP
#
# $preempt_delay::         Seconds after startup until preemption
#                          Range: 0 to 1,000
#                          NOTE: For this to work, the initial state of this
#                          entry must be BACKUP
#
# $advert_int::            The interval between VRRP packets
#                          Default: 1 second.
#
# $garp_master_delay::     The delay for gratuitous ARP after transition
#                          to MASTER
#                          Default: 5 seconds.
#
# $garp_master_refresh::   Repeat gratuitous ARP after transition to MASTER
#                          this often.
#                          Default: undef.
#
# $notify_script_master::  Define the notify master script.
#                          Default: undef.
#
# $notify_script_backup::  Define the notify backup script.
#                          Default: undef.
#
# $notify_script_fault::   Define the notify fault script.
#                          Default: undef.
#
# $notify_script_stop::    Define the notify stop script.
#                          Default: undef.
#
# $notify_script::         Define the notify script.
#                          Default: undef.
#
# $multicast_source_ip::   default IP for binding vrrpd is the primary IP
#                          on interface. If you want to hide the location of vrrpd,
#                          use this IP as src_addr for multicast vrrp packets.
#                          Default: undef.
#
# $unicast_source_ip::     default IP for binding vrrpd is the primary IP
#                          on interface. If you want to hide the location of vrrpd,
#                          use this IP as src_addr for unicast vrrp packets.
#                          Default: undef.
#
# $unicast_peers::         Do not send VRRP adverts over VRRP multicast group.
#                          Instead send adverts to the list of ip addresses using 
#                          a unicast design fashion.
#
#                          May be specified as an array with ip addresses
#                          Default: undef.
#
# $dont_track_primary      Tells keepalived to ignore VRRP interface faults.
#                          Can be useful on setup where two routers are
#                          connected directly to each other on the interface
#                          used for VRRP. Without this feature the link down
#                          caused by one router crashing would also inspire
#                          the other router to lose (or not gain) MASTER state,
#                          since it was also tracking link status.
#                          Default: false.

define keepalived::vrrp::instance (
  $interface,
  $priority,
  $state,
  $virtual_ipaddress,
  $virtual_router_id,
  $ensure                     = present,
  $auth_type                  = undef,
  $auth_pass                  = undef,
  $track_script               = undef,
  $track_interface            = undef,
  $lvs_interface              = undef,
  $virtual_ipaddress_int      = undef,
  $virtual_ipaddress_excluded = undef,
  $virtual_routes             = undef,
  $smtp_alert                 = false,
  $nopreempt                  = false,
  $preempt_delay              = undef,
  $advert_int                 = 1,
  $garp_master_delay          = 5,
  $garp_master_refresh        = undef,
  $notify_script_master       = undef,
  $notify_script_backup       = undef,
  $notify_script_fault        = undef,
  $notify_script_stop         = undef,
  $notify_script              = undef,
  $multicast_source_ip        = undef,
  $unicast_source_ip          = undef,
  $unicast_peers              = undef,
  $dont_track_primary         = false,

) {
  $_name = regsubst($name, '[:\/\n]', '')

  if (!is_integer($priority) or ($priority + 0) < 1 or ($priority + 0) > 254) {
    fail('priority must be an integer 1 >= and <= 254')
  }
  if (!is_integer($virtual_router_id) or ($virtual_router_id + 0) < 1 or ($virtual_router_id + 0) > 255) {
    fail('virtual_router_id must be an integer >= 1 and <= 255')
  }

  concat::fragment { "keepalived.conf_vrrp_instance_${_name}":
    ensure  => $ensure,
    target  => "${::keepalived::config_dir}/keepalived.conf",
    content => template('keepalived/vrrp_instance.erb'),
    order   => '100',
  }
}

