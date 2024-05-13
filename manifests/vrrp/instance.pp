# @summary
#   Configure VRRP instance
#
# @param interface
#   Define which interface to listen on.
#
# @param priority
#   Set instance priority.
#
# @param state
#   Set instance state.
#
# @param virtual_ipaddress_int
#   Set interface for VIP to be assigned to,
#
# @param virtual_ipaddress
#   Set floating IP address.
#
# @example
#   May be specified as either:
#   a) ip address (or array of IP addresses)
#      e.g. `'10.0.0.1'`
#   b) a hash (or array of hashes) containing
#      extra properties
#      e.g. `{ 'ip' => '10.0.0.1', 'label' => 'webvip' }`
#      Supported properties: dev, brd, label, scope.
#
# @param promote_secondaries
#   Set the promote_secondaries flag on the interface to stop other
#   addresses in the same CIDR being removed when 1 of them is removed
#   For example if 10.1.1.2/24 and 10.1.1.3/24 are both configured on an
#   interface, and one is removed, unless promote_secondaries is set on
#   the interface the other address will also be removed.
#
# @param virtual_routes
#   Set floating routes.
#
# @example
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
# @example
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
#
# @example
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
#
# @param auth_pass
#   Authentication password.
#
# @param track_script
#   Define which scripts to run to track service states.
#   Must be specified as an Array of Strings with multiple Scriptnames.
#
# @param track_process
#   Define which process trackers to run.
#
# @param track_file
#   Define which file trackers to run. References a track_file block that can be created with keepalived::vrrp::track_file.
#
# @param vrrp_track_file
#   Define which file trackers to run. Deprecated, for keepalived < 2.1.0. References a vrrp_track_file block that can be created with keepalived::vrrp::vrrp_track_file.
#
# @param track_interface
#   Define which interface(s) to monitor.
#   Go to FAULT state if one of
#   these interfaces goes down.
#   May be specified as either:
#     a) interface name
#     b) array of interfaces names
#
# @param lvs_interface
#   Define lvs_sync_daemon_interface.
#
# @param smtp_alert
#   Send status alerts via SMTP. Requires user provided
#   in SMTP settings in keepalived::global_defs class.
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
#
# @param garp_master_delay
#   The delay for gratuitous ARP after transition
#   to MASTER
#
# @param garp_master_refresh
#   Repeat gratuitous ARP after transition to MASTER
#   this often.
#
# @param notify_script_master
#   Define the notify master script.
#
# @param notify_script_backup
#   Define the notify backup script.
#
# @param notify_script_fault
#   Define the notify fault script.
#
# @param notify_script_stop
#   Define the notify stop script.
#
# @param notify_script
#   Define the notify script.
#
# @param multicast_source_ip
#   default IP for binding vrrpd is the primary IP
#   on interface. If you want to hide the location of vrrpd,
#   use this IP as src_addr for multicast vrrp packets.
#
# @param notify_script_master_rx_lower_pri
#   Define the notify_master_rx_lower_pri script.
#   This is executed if a master receives an advert with
#   priority lower than the master's advert.
#
# @param unicast_source_ip
#   default IP for binding vrrpd is the primary IP
#   on interface. If you want to hide the location of vrrpd,
#   use this IP as src_addr for unicast vrrp packets.
#
# @param unicast_peers
#   Do not send VRRP adverts over VRRP multicast group.
#   Instead send adverts to the list of ip addresses using
#   a unicast design fashion.
#
#   May be specified as an array with ip addresses
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
#   Use virtual MAC address for VRRP packages.
#
# @param vmac_xmit_base
#   When using virtual MAC addresses transmit and receive
#   VRRP messaged on the underlying interface whilst ARP
#   will happen from the the VMAC interface.
#
# @param use_vmac_addr
#   Use virtual MAC address for virtual IP addresses.
#
# @param native_ipv6 Force instance to use IPv6 (when mixed IPv4 and IPv6 config)
#
# @param garp_lower_prio_repeat
#
# @param higher_prio_send_advert
#
# @param collect_unicast_peers
#
define keepalived::vrrp::instance (
  $interface,
  Integer[1,254] $priority,
  $state,
  Integer[1,255] $virtual_router_id,
  $virtual_ipaddress                                                      = undef,
  $auth_type                                                              = undef,
  Optional[Variant[String, Sensitive[String]]] $auth_pass                 = undef,
  Array[String[1]] $track_script                                          = [],
  Array[String[1]] $track_process                                         = [],
  Array[String[1]] $track_file                                            = [],
  Array[String[1]] $vrrp_track_file                                       = [],
  Array[String[1]] $track_interface                                       = [],
  $lvs_interface                                                          = undef,
  $virtual_ipaddress_int                                                  = undef,
  $virtual_ipaddress_excluded                                             = undef,
  Boolean $promote_secondaries                                            = false,
  $virtual_routes                                                         = undef,
  Array[Keepalived::Vrrp::Instance::VRule] $virtual_rules                 = [],
  $smtp_alert                                                             = false,
  $nopreempt                                                              = false,
  $preempt_delay                                                          = undef,
  $advert_int                                                             = 1,
  $garp_master_delay                                                      = 5,
  $garp_master_refresh                                                    = undef,
  Optional[Integer] $garp_lower_prio_repeat                               = undef,
  Optional[Boolean] $higher_prio_send_advert                              = undef,
  Optional[Stdlib::Absolutepath] $notify_script_master_rx_lower_pri       = undef,
  $notify_script_master                                                   = undef,
  $notify_script_backup                                                   = undef,
  $notify_script_fault                                                    = undef,
  $notify_script_stop                                                     = undef,
  $notify_script                                                          = undef,
  $multicast_source_ip                                                    = undef,
  Optional[Stdlib::IP::Address] $unicast_source_ip                        = undef,
  Variant[Array[Stdlib::IP::Address], Stdlib::IP::Address] $unicast_peers = [],
  Boolean $collect_unicast_peers                                          = false,
  $dont_track_primary                                                     = false,
  $use_vmac                                                               = false,
  $vmac_xmit_base                                                         = true,
  Boolean $use_vmac_addr                                                  = false,
  Boolean $native_ipv6                                                    = false,
) {
  $_name = regsubst($name, '[:\/\n]', '', 'G')
  $_ordersafe = regsubst($_name, '-', '', 'G')
  $unicast_peer_array = [$unicast_peers].flatten
  $auth_pass_unsensitive = if $auth_pass =~ Sensitive {
    $auth_pass.unwrap
  } else {
    $auth_pass
  }

  if size($unicast_peer_array) > 0 or $collect_unicast_peers {
    concat::fragment { "keepalived.conf_vrrp_instance_${_name}_upeers_header":
      target  => "${keepalived::config_dir}/keepalived.conf",
      content => "  unicast_peer {\n",
      order   => "100-${_ordersafe}-010",
    }

    if $collect_unicast_peers {
      if $unicast_source_ip != undef {
        $unicast_src = $unicast_source_ip
      } else {
        $unicast_src = inline_template("<%= scope.lookupvar('::ipaddress_${interface}') -%>")
      }

      @@keepalived::vrrp::unicast_peer { "${name}_${unicast_src}":
        instance   => $name,
        ip_address => $unicast_src,
      }
      Keepalived::Vrrp::Unicast_peer <<| instance == $name and ip_address != $unicast_src |>>
    }

    if size($unicast_peer_array) > 0 {
      $unicast_peer_array.each | $_peer | {
        keepalived::vrrp::unicast_peer { "${name}_${_peer}":
          instance   => $name,
          ip_address => $_peer,
        }
      }
    }

    concat::fragment { "keepalived.conf_vrrp_instance_${_name}_upeers_footer":
      target  => "${keepalived::config_dir}/keepalived.conf",
      content => "  }\n\n",
      order   => "100-${_ordersafe}-030",
    }
  }

  $_content = if $auth_pass =~ Sensitive {
    Sensitive(template('keepalived/vrrp_instance.erb'))
  } else {
    template('keepalived/vrrp_instance.erb')
  }
  concat::fragment { "keepalived.conf_vrrp_instance_${_name}":
    target  => "${keepalived::config_dir}/keepalived.conf",
    content => $_content,
    order   => "100-${_ordersafe}-000",
  }

  concat::fragment { "keepalived.conf_vrrp_instance_${_name}_footer":
    target  => "${keepalived::config_dir}/keepalived.conf",
    content => "}\n\n",
    order   => "100-${_ordersafe}-zzz",
  }
}
