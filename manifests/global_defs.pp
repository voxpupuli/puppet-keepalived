# == Class keepalived::global_defs
#
# === Parameters:
# process_names::                  Set the process names of the keepalived
#                                  processes to the default values
#                                  Default: undef.
#
# $process_name::                  Specify the individual process name
#                                  Default: undef.
#
# $vrrp_process_name::             Specify the individual process name
#                                  Default: undef.
#
# $ipvs_process_name::             Specify the individual process name
#                                  Default: undef.
#
# $bfd_process_name::              Specify the individual process name
#                                  Default: undef.
#
# $startup_script::                The startup scripts are run once, when
#                                  keepalived starts before any child processes
#                                  are run.
#                                  Usage: SCRIPT_NAME [username [groupname]]
#                                  Default: undef.
#
# $startup_script_timeout::        SECONDS    # range [1,1000]
#                                  Default: undef.
#
# $shutdown_script::               The shutdown scripts are run once, when
#                                  keepalived stops after all child processes
#                                  have terminated, respectively.
#                                  Usage: SCRIPT_NAME [username [groupname]]
#                                  Default: undef.
#
# $shutdown_script_timeout         SECONDS    # range [1,1000]
#                                  Default: undef.
#
#
# $notification_email::            Array of notification email Recipients.
#                                  Default: undef.
#
# $notification_email_from::       Define the notification email Sender.
#                                  Default: undef.
#
# $smtp_server::                   Define the smtp server addres.
#                                  Default: undef.
#
# $smtp_helo_name::                Name to use in HELO messages.
#                                  Default: undef.
#
# $smtp_connect_timeout::          Define the smtp connect timeout.
#                                  Default: undef.
#
# $smtp_alert::                    Sets default state for all smtp_alerts
#                                  Default: undef.
#
# $smtp_alert_vrrp::               Sets default state for vrrp smtp_alerts
#                                  Default: undef.
#
# $smtp_alert_checker::            Sets default state for checker smtp_alerts
#                                  Default: undef.
#
# $checker_log_all_failures::      Sets logging all checker failes while checker
#                                  up
#                                  Default: undef.
#
# $no_email_faults::               Don't send smtp alerts for fault conditions
#                                  Default: undef.
#
# $router_id::                     String identifying the machine
#                                  (doesn't have to be hostname).
#                                  Default: undef.
#
# $vrrp_mcast_group4::             Multicast Group to use for IPv4 VRRP adverts
#                                  Default: undef.
#
# $vrrp_mcast_group6::             Multicast Group to use for IPv6 VRRP adverts
#                                  Default: undef.
#
# $default_interface::             Sets the default interface for static
#                                  addresses.
#                                  Default: undef.
#
# $lvs_sync_daemon::               See kernel source
#                                  doc/Documentation/networking/ipvs-sysctl.txt
#                                  for details of parameters controlling IPVS
#                                  and the sync daemon.
#                                  Default: undef.
#
# $lvs_flush::                     Flush any existing LVS configuration
#                                  at startup
#                                  Default: undef.
#
# $lvs_flush_onstop::              Flush remaining LVS configuration at shutdown
#                                  Default: undef.
#
# $vrrp_garp_master_delay::        Delay for second set of gratuitous ARPs after
#                                  transition to MASTER.
#                                  Default: undef.
#
# $vrrp_garp_master_repeat::       Number of gratuitous ARP messages to send at
#                                  a time after transition to MASTER.
#                                  Default: undef.
#
# $vrrp_garp_lower_prio_delay::    Delay for second set of gratuitous ARPs after
#                                  lower priority  advert received when MASTER.
#                                  Default: undef.
#
# $vrrp_garp_lower_prio_repeat::   Number of gratuitous ARP messages to send at
#                                  a time after lower priority advert received
#                                  when MASTER.
#                                  Default: undef.
#
# $vrrp_garp_master_refresh::      Minimum time interval for refreshing
#                                  gratuitous ARPs while MASTER.
#                                  Default: undef.
#
# $vrrp_garp_master_refresh_repeat::  Number of gratuitous ARP messages to send
#                                  at a time while MASTER
#                                  Default: undef.
#
# $vrrp_garp_interval::            Delay in ms between gratuitous ARP messages
#                                  sent on an interface
#                                  Default: undef.
#
# $vrrp_gna_interval::             Delay in ms between unsolicited NA messages
#                                  sent on an interface
#                                  Default: undef.
#
# $vrrp_min_garp::                 Setting vrrp_min_garp causes only one ARP/NA
#                                  message to be sent, with no repeat 5 seconds
#                                  later.
#                                  Default: undef.
#
# $vrrp_lower_prio_no_advert::     If a lower priority advert is received, don't
#                                  send another advert.
#                                  Default: undef.
#
# $vrrp_higher_prio_send_advert::  If we are master and receive a higher
#                                  priority advert, send an advert, before we
#                                  transition to backup.
#                                  Default: undef.
#
# $vrrp_version::                  Set the default VRRP version to use
#                                  Default: undef.
#
# $nftables::                      Use nftables and not iptables.
#                                  Default: undef.
#
# $nftables_priority::             Set nftables table priority.
#                                  Default: undef.
#
# $nftables_counters::             Add counters to rules.
#                                  Default: undef.
#
# $nftables_ifindex::              Create IPv6 link local sets using ifindex
#                                  rather than ifnames.
#                                  Default: undef.
#
# $vrrp_iptables::                 Use default chains ("INPUT" and "OUTPUT"), or
#                                  use one chain (i.e. "keepalived"), or
#                                  use two chains
#                                  (i.e. "keepalived_in keepalived_out")
#                                  Default: undef.
#
# $vrrp_ipsets::                   Keepalived may have the option to use ipsets
#                                  in conjunction with iptables
#                                  Default: undef.
#
# $vrrp_check_unicast_src::        Checking that when in unicast mode, the
#                                  source address of a VRRP packet is one of our #                                  unicast peers.
#                                  Default: undef.
#
# $vrrp_skip_check_adv_addr::      The check won't be carried out if the advert
#                                  is from the same master router as the
#                                  previous advert received.
#                                  Default: undef.
#
# $vrrp_strict::                   Enforce strict VRRP protocol compliance.
#                                  Default: undef.
#
# $vrrp_notify_priority_changes::  Send vrrp instance priority notifications on
#                                  notify FIFOs.
#                                  Default: undef.
#
# $max_auto_priority::             Configure max_auto_priority
#                                  Default: undef.
#
# $min_auto_priority_delay::       Minimum delay in microseconds after timer
#                                  expires before keeplalived is scheduled after
#                                  which the process priority will be auto
#                                  incremented
#                                  Default: undef.
#
# $vrrp_priority::                 Set the vrrp child process priority
#                                  Default: undef.
#
# $checker_priority::              Set the checker child process priority
#                                  Default: undef.
#
# $bfd_priority::                  Set the BFD child process priority
#                                  Default: undef.
#
# $vrrp_no_swap::                  Set the vrrp child process non swappable
#                                  Default: undef.
#
# $checker_no_swap::               Set the checker child process non swappable
#                                  Default: undef.
#
# $bfd_no_swap::                   Set the BFD child process non swappable
#                                  Default: undef.
#
# $$vrrp_cpu_affinity::            CPU Affinity for the vrrp child process
#                                  Default: undef.
#
# $checker_cpu_affinity::          CPU Affinity for the checker child process
#                                  Default: undef.
#
# $bfd_cpu_affinity::              CPU Affinity for the bfd child process
#                                  Default: undef.
#
# $vrrp_rt_priority::              Set the vrrp child process to use real-time
#                                  scheduling at the specified priority
#                                  Default: undef.
#
# $checker_rt_priority::           Set the checker child process to use
#                                  real-time scheduling at the specified
#                                  priority
#                                  Default: undef.
#
# $bfd_rt_priority::               Set the BFD child process to use real-time
#                                  scheduling at the specified  priority
#                                  Default: undef.
#
# $vrrp_rlimit_rttime::            Set the limit on CPU time between blocking
#                                  system calls, in microseconds
#                                  Default: undef.
#
# $checker_rlimit_rttime::         Set the limit on CPU time between blocking
#                                  system calls, in microseconds
#                                  Default: undef.
#
# $bfd_rlimit_rttime::             Set the limit on CPU time between blocking
#                                  system calls, in microseconds
#                                  Default: undef.
#
# $snmp_socket::                   Specify socket to use for connecting to SNMP
#                                  master agent
#                                  Default: undef.
#
# $enable_snmp_keepalived::        Depricated since 2018-03-05.
#                                  Use enable_snmp_vrrp
#                                  Default: undef.
#
# $enable_snmp_vrrp::              Enable SNMP handling of vrrp element of
#                                  KEEPALIVED MIB
#                                  Default: undef.
#
# $enable_snmp_checker::           Enable SNMP handling of checker element of
#                                  KEEPALIVED MIB
#                                  Default: undef.
#
# $enable_snmp_rfc::               Enable SNMP handling of RFC2787 and RFC6527
#                                  VRRP MIBs
#                                  Default: undef.
#
# $enable_snmp_rfcv2::             Enable SNMP handling of RFC2787 VRRP MIB
#                                  Default: undef.
#
# $enable_snmp_rfcv3::             Enable SNMP handling of RFC6527 VRRP MIB
#                                  Default: undef.
#
# $enable_traps::                  Enable SNMP traps
#                                  Default: undef.
#
# $enable_dbus::                   Enable the DBus interface
#                                  Default: undef.
#
# $dbus_service_name::             Name of DBus service
#                                  Default: undef.
#
# $script_user                     Specify the default username/groupname to
#                                  run scripts under.
#                                  If this option is not specified, the user
#                                  defaults to keepalived_script if that user
#                                  exists, otherwise root.
#                                  If groupname is not specified, it defaults to
#                                  the user's group.
#                                  Default: undef.
#
# $enable_script_security::        Don't run scripts configured to be run as
#                                  root if any part of the path is writable by
#                                  a non-root user.
#                                  Default: undef.
#
# $notify_fifo::                   FIFO to write notify events to
#                                  Default: undef.
#
# $notify_fifo_script::            Script to be run to process notify events
#                                  Default: undef.
#
# $vrrp_notify_fifo::              FIFO to write vrrp notify events to.
#                                  Default: undef.
#
# $vrrp_notify_fifo_script::       Script to be run to process vrrp notify events
#                                  Default: undef.
#
# $lvs_notify_fifo::               FIFO to write notify healthchecker events to
#                                  Default: undef.
#
# $lvs_notify_fifo_script::        Script to be run to process healthchecher
#                                  notify events
#                                  Default: undef.
#
# $dynamic_interfaces::            Allow configuration to include interfaces
#                                  that don't exist at startup.
#                                  Default: undef.
#
# $vrrp_netlink_cmd_rcv_bufs::     Set netlink receive buffer size
#                                  Default: undef.
#
# $vrrp_netlink_cmd_rcv_bufs_force::  Force vrrp_netlink_cmd_rcv_bufs
#                                     Default: undef.
#
# $vrrp_netlink_monitor_rcv_bufs::    Set netlink read receive buffer size
#                                     Default: undef.
#
# $vrrp_netlink_monitor_rcv_bufs_force::  Force vrrp_netlink_monitor_rcv_bufs
#                                         Default: undef.
#
# $lvs_netlink_cmd_rcv_bufs::             Set lvs_netlink_cmd_rcv_bufs
#                                         Default: undef.
#
# $lvs_netlink_cmd_rcv_bufs_force::       Force lvs_netlink_cmd_rcv_bufs
#                                         Default: undef.
#
# $lvs_netlink_monitor_rcv_bufs::         Set lvs_netlink_monitor_rcv_bufs
#                                         Default: undef.
#
# $lvs_netlink_monitor_rcv_bufs_force::   Force lvs_netlink_monitor_rcv_bufs
#                                         Default: undef.
#
# $process_monitor_rcv_bufs::         Set process_monitor_rcv_bufs
#                                     Default: undef.
#
# $process_monitor_rcv_bufs_force::   Force process_monitor_rcv_bufs
#                                     Default: undef.
#
# $vrrp_rx_bufs_policy::              Set vrrp_rx_bufs_policy
#                                     Default: undef.
#
# $vrrp_rx_bufs_multiplier::          Set vrrp_rx_bufs_multiplier
#                                     Default: undef.
#
# $rs_init_notifies::                 Send notifies at startup for real servers
#                                     that are starting up
#                                     Default: undef.
#
# $no_checker_emails::                Don't send an email every time a real
#                                     server checker changes state;
#                                     only send email when a real server is
#                                     added or removed
#                                     Default: undef.
#
# $umask::                            The umask to use for creating files.
#                                     Default: undef.
#
# $vrrp_startup_delay::               Specifies a delay in seconds before vrrp
#                                     instances start up after keepalived starts
#                                     Default: undef.
#
# $log_unknown_vrids::                Logging of receipt of VRRP adverts for
#                                     VRIDs not configured on the interface on
#                                     which they are received
#                                     Default: undef.
#
# $random_seed::                      Specify random seed for ${_RANDOM}
#                                     Default: undef.
#
# $reload_time_file::                 Set reload_time_file
#                                     Default: undef.
#
# $reload_repeat::                    Set reload_repeat
#                                     Default: undef.
#
#
class keepalived::global_defs (
  Optional[Boolean] $process_names                = undef,
  Optional[String] $process_name                  = undef,
  Optional[String] $vrrp_process_name             = undef,
  Optional[String] $ipvs_process_name             = undef,
  Optional[String] $bfd_process_name              = undef,
  Optional[String] $startup_script                = undef,
  Optional[Integer] $startup_script_timeout       = undef,
  Optional[String] $shutdown_script               = undef,
  Optional[Integer] $shutdown_script_timeout      = undef,
  Variant[String, Array[String]] $notification_email  = undef,
  Optional[String] $notification_email_from       = undef,
  Optional[String] $smtp_server                   = undef,
  Optional[String] $smtp_helo_name                = undef,
  Optional[Integer] $smtp_connect_timeout         = undef,
  Optional[Boolean] $smtp_alert                   = undef,
  Optional[Boolean] $smtp_alert_vrrp              = undef,
  Optional[Boolean] $smtp_alert_checker           = undef,
  Optional[Boolean] $checker_log_all_failures     = undef,
  Optional[Boolean] $no_email_faults              = undef,
  Optional[String] $router_id                     = undef,
  Optional[String] $vrrp_mcast_group4             = undef,
  Optional[String] $vrrp_mcast_group6             = undef,
  Optional[String] $default_interface             = undef,
  Optional[String] $lvs_sync_daemon               = undef,
  Optional[Boolean] $lvs_flush                    = undef,
  Variant[Boolean, String] $lvs_flush_onstop          = undef,
  Optional[Integer] $vrrp_garp_master_delay           = undef,
  Optional[Integer] $vrrp_garp_master_repeat          = undef,
  Optional[Integer] $vrrp_garp_lower_prio_delay       = undef,
  Optional[Integer] $vrrp_garp_lower_prio_repeat      = undef,
  Optional[Integer] $vrrp_garp_master_refresh         = undef,
  Optional[Integer] $vrrp_garp_master_refresh_repeat  = undef,
  Optional[Float] $vrrp_garp_interval                 = undef,
  Optional[Float] $vrrp_gna_interval                  = undef,
  Optional[Boolean] $vrrp_min_garp                    = undef,
  Optional[Boolean] $vrrp_lower_prio_no_advert        = undef,
  Optional[Boolean] $vrrp_higher_prio_send_advert     = undef,
  Optional[Integer] $vrrp_version                     = undef,
  Variant[Boolean, String] $nftables                  = undef,
  Optional[Integer] $nftables_priority                = undef,
  Optional[Boolean] $nftables_counters                = undef,
  Optional[Boolean] $nftables_ifindex                 = undef,
  Variant[Boolean, String] $vrrp_iptables             = undef,
  Optional[String] $vrrp_ipsets                       = undef,
  Optional[Boolean] $vrrp_check_unicast_src           = undef,
  Optional[Boolean] $vrrp_skip_check_adv_addr         = undef,
  Optional[Boolean] $vrrp_strict                      = undef,
  Optional[Boolean] $vrrp_notify_priority_changes     = undef,
  Variant[Boolean, Integer] $max_auto_priority        = undef,
  Optional[Integer] $min_auto_priority_delay          = undef,
  Optional[Integer] $vrrp_priority                    = undef,
  Optional[Integer] $checker_priority                 = undef,
  Optional[Integer] $bfd_priority                     = undef,
  Optional[Boolean] $vrrp_no_swap                     = undef,
  Optional[Boolean] $checker_no_swap                  = undef,
  Optional[Boolean] $bfd_no_swap                      = undef,
  Optional[String] $vrrp_cpu_affinity                 = undef,
  Optional[String] $checker_cpu_affinity              = undef,
  Optional[String] $bfd_cpu_affinity                  = undef,
  Optional[Integer] $vrrp_rt_priority                 = undef,
  Optional[Integer] $checker_rt_priority              = undef,
  Optional[Integer] $bfd_rt_priority                  = undef,
  Optional[Integer] $vrrp_rlimit_rttime               = undef,
  Optional[Integer] $checker_rlimit_rttime            = undef,
  Optional[Integer] $bfd_rlimit_rttime                = undef,
  Optional[String] $snmp_socket                       = undef,
  Optional[Boolean] $enable_snmp_keepalived           = undef,
  Optional[Boolean] $enable_snmp_vrrp                 = undef,
  Optional[Boolean] $enable_snmp_checker              = undef,
  Optional[Boolean] $enable_snmp_rfc                  = undef,
  Optional[Boolean] $enable_snmp_rfcv2                = undef,
  Optional[Boolean] $enable_snmp_rfcv3                = undef,
  Optional[Boolean] $enable_traps                     = undef,
  Optional[Boolean] $enable_dbus                      = undef,
  Optional[String] $dbus_service_name                 = undef,
  Optional[String] $script_user                       = undef,
  Optional[Boolean] $enable_script_security           = undef,
  Optional[String] $notify_fifo                       = undef,
  Optional[String] $notify_fifo_script                = undef,
  Optional[String] $vrrp_notify_fifo                  = undef,
  Optional[String] $vrrp_notify_fifo_script           = undef,
  Optional[String] $lvs_notify_fifo                   = undef,
  Optional[String] $lvs_notify_fifo_script            = undef,
  Variant[Boolean, String] $dynamic_interfaces        = undef,
  Optional[Integer] $vrrp_netlink_cmd_rcv_bufs        = undef,
  Optional[Boolean] $vrrp_netlink_cmd_rcv_bufs_force  = undef,
  Optional[Integer] $vrrp_netlink_monitor_rcv_bufs     = undef,
  Optional[Boolean] $vrrp_netlink_monitor_rcv_bufs_force  = undef,
  Optional[Integer] $lvs_netlink_cmd_rcv_bufs         = undef,
  Optional[Boolean] $lvs_netlink_cmd_rcv_bufs_force   = undef,
  Optional[Integer] $lvs_netlink_monitor_rcv_bufs     = undef,
  Optional[Boolean] $lvs_netlink_monitor_rcv_bufs_force   = undef,
  Optional[Integer] $process_monitor_rcv_bufs         = undef,
  Optional[Boolean] $process_monitor_rcv_bufs_force   = undef,
  Variant[String, Integer] $vrrp_rx_bufs_policy       = undef,
  Optional[Integer] $vrrp_rx_bufs_multiplier          = undef,
  Optional[Boolean] $rs_init_notifies                 = undef,
  Optional[Boolean] $no_checker_emails                = undef,
  Variant[Boolean,String] $umask                      = undef,
  Variant[Float, Integer] $vrrp_startup_delay         = undef,
  Optional[Boolean] $log_unknown_vrids                = undef,
  Optional[Integer] $random_seed                      = undef,
  Optional[String] $reload_time_file                  = undef,
  Optional[Boolean] $reload_repeat                    = undef,
) {
  concat::fragment { 'keepalived.conf_globaldefs':
    target  => "${keepalived::config_dir}/keepalived.conf",
    content => template('keepalived/globaldefs.erb'),
    order   => '010',
  }
}
