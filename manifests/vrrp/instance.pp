# @summary keepalived::vrrp::instance
#
# @param interface
#   Define which interface to listen on.
#
# @param priority
#   Set instance priority.
#
# @param state
#   Set instance state.
#   Valid options: MASTER, BACKUP.
#
# @param virtual_ipaddress_int
#   Set interface for VIP to be assigned to,
#   defaults to $interface
#
# @param virtual_ipaddress
#   Set floating IP address.
#
#   May be specified as either:
#   a) ip address (or array of IP addresses)
#      e.g. `'10.0.0.1'`
#   b) a hash (or array of hashes) containing
#      extra properties
#      e.g. `{ 'ip' => '10.0.0.1', 'label' => 'webvip' }`
#      Supported properties: dev, brd, label, scope.
#
# @param virtual_routes
#   Set floating routes.
#
#   May be specified as a hash (or array of hashes)
#     containing extra properties
#       e.g. `{ 'src' => '10.0.0.1',
#               'to' => '192.168.30.0/24',
#               'via' => '10.0.0.254',
#               'metric' => '15' }`
#   Supported properties: src, to, via, dev, scope, table, metric
#
# @param virtual_rules
#   Set floating rules.
#
#   May be specified as a hash (or array of hashes)
#      containing extra properties
#      e.g. `{ 'from' => '10.0.0.1',
#              'via' => '10.0.0.254',
#              'lookup' => 'customroute',
#              'metric' => '15' }`
#      Supported properties: from, to, dev, lookup, metric
#
# @param virtual_ipaddress_excluded
#   For cases with large numbers (eg 200) of IPs
#   on the same interface. To decrease the number
#   of packets sent in adverts, you can exclude
#   most IPs from adverts.
#   Default: undef.
#
#   May be specified as either:
#   a) ip address (or array of IP addresses)
#      e.g. `'10.0.0.1'`
#   b) a hash (or array of hashes) containing
#      extra properties
#   e.g. `{ 'ip'=>'10.0.0.1', 'scope'=>'local' }`
#   Supported properties: dev, brd, label, scope.
#
# @param virtual_router_id
#   Set virtual router id.
#
# @param auth_type
#   Set authentication method.
#   Default: undef.
#
# @param auth_pass
#   Authentication password.
#   Default: undef.
#
# @param track_script
#   Define which script to run to track service states.
#   Default: undef.
#
# @param track_process
#   Define which process trackers to run.
#   Default: undef.
#
# @param track_interface
#   Define which interface(s) to monitor.
#   Go to FAULT state if one of
#   these interfaces goes down.
#   May be specified as either:
#     a) interface name
#     b) array of interfaces names
#   Default: undef.
#
# @param lvs_interface
#   Define lvs_sync_daemon_interface.
#   Default: undef.
#
# @param smtp_alert
#   Send status alerts via SMTP. Requires user provided
#   in SMTP settings in keepalived::global_defs class.
#   Default: false.
#
# @param nopreempt
#   Allows the lower priority machine to maintain
#   the master role, when a higher priority machine
#   comes back online.
#   NOTE: For this to work, the initial state of this
#   entry must be BACKUP
#
# @param preempt_delay
#   Seconds after startup until preemption
#   Range: 0 to 1,000
#   NOTE: For this to work, the initial state of this
#   entry must be BACKUP
#
# @param advert_int
#   The interval between VRRP packets
#   Default: 1 second.
#
# @param garp_master_delay
#   The delay for gratuitous ARP after transition
#   to MASTER
#   Default: 5 seconds.
#
# @param garp_master_refresh
#   Repeat gratuitous ARP after transition to MASTER
#   this often.
#   Default: undef.
#
# @param notify_script_master
#   Define the notify master script.
#   Default: undef.
#
# @param notify_script_backup
#   Define the notify backup script.
#   Default: undef.
#
# @param notify_script_fault
#   Define the notify fault script.
#   Default: undef.
#
# @param notify_script_stop
#   Define the notify stop script.
#   Default: undef.
#
# @param notify_script
#   Define the notify script.
#   Default: undef.
#
# @param multicast_source_ip
#   default IP for binding vrrpd is the primary IP
#   on interface. If you want to hide the location of vrrpd,
#   use this IP as src_addr for multicast vrrp packets.
#   Default: undef.
#
# @param notify_script_master_rx_lower_pri
#   Define the notify_master_rx_lower_pri script.
#   This is executed if a master receives an advert with
#   priority lower than the master's advert.
#   Default: undef.
#
# @param unicast_source_ip
#   default IP for binding vrrpd is the primary IP
#   on interface. If you want to hide the location of vrrpd,
#   use this IP as src_addr for unicast vrrp packets.
#   Default: undef.
#
# @param unicast_peers
#   Do not send VRRP adverts over VRRP multicast group.
#   Instead send adverts to the list of ip addresses using
#   a unicast design fashion.
#
#   May be specified as an array with ip addresses
#   Default: undef.
#
# @param dont_track_primary
#   Tells keepalived to ignore VRRP interface faults.
#   Can be useful on setup where two routers are
#   connected directly to each other on the interface
#   used for VRRP. Without this feature the link down
#   caused by one router crashing would also inspire
#   the other router to lose (or not gain) MASTER state,
#   since it was also tracking link status.
#   Default: false.
#
# @param use_vmac
#   Use virtual MAC address for virtual IP addresses.
#
# @param vmac_xmit_base
#   When using virtual MAC addresses transmit and receive
#   VRRP messaged on the underlying interface whilst ARP
#   will happen from the the VMAC interface.
#
# @param native_ipv6
#   Force instance to use IPv6 (when mixed IPv4 and IPv6 config)
#
define keepalived::vrrp::instance (
  $interface,
  Integer[1,254] $priority,
  $state,
  Integer[1,255] $virtual_router_id,
  $virtual_ipaddress                                                = undef,
  $auth_type                                                        = undef,
  $auth_pass                                                        = undef,
  $track_script                                                     = undef,
  Optional[Array[String[1]]] $track_process                         = undef,
  $track_interface                                                  = undef,
  $lvs_interface                                                    = undef,
  $virtual_ipaddress_int                                            = undef,
  $virtual_ipaddress_excluded                                       = undef,
  $virtual_routes                                                   = undef,
  Optional[Array[Keepalived::Vrrp::Instance::VRule]] $virtual_rules = undef,
  $smtp_alert                                                       = false,
  $nopreempt                                                        = false,
  $preempt_delay                                                    = undef,
  $advert_int                                                       = 1,
  $garp_master_delay                                                = 5,
  $garp_master_refresh                                              = undef,
  Optional[Integer] $garp_lower_prio_repeat                         = undef,
  Optional[Boolean] $higher_prio_send_advert                        = undef,
  Optional[Stdlib::Absolutepath] $notify_script_master_rx_lower_pri = undef,
  $notify_script_master                                             = undef,
  $notify_script_backup                                             = undef,
  $notify_script_fault                                              = undef,
  $notify_script_stop                                               = undef,
  $notify_script                                                    = undef,
  $multicast_source_ip                                              = undef,
  $unicast_source_ip                                                = undef,
  $unicast_peers                                                    = undef,
  $dont_track_primary                                               = false,
  $use_vmac                                                         = false,
  $vmac_xmit_base                                                   = true,
  Boolean $native_ipv6                                              = false,

) {
  $_name = regsubst($name, '[:\/\n]', '')

  concat::fragment { "keepalived.conf_vrrp_instance_${_name}":
    target  => "${keepalived::config_dir}/keepalived.conf",
    content => template('keepalived/vrrp_instance.erb'),
    order   => '100',
  }
}

