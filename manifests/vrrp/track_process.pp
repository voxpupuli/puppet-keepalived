# == Define: keepalived::vrrp::track_process
#
# === Parameters:
#
# $ensure::   Default: present
#
# $proc_name:: process name to track
#              Default: undef (error)
#
# $weight::   The weight that should add to the instance.
#             Default: undef (see keepalived.conf(5) for default)
#
# $quorum::   Number of processes to expect running
#             Default: 1
#
# $delay::    Time to delay after process quorum lost before
#             considering process failed (in fractions of second)
#             Default: undef
#
# $full_command::  Match entire process cmdline
#             Default: undef
#
# $param_match::  Set inital if command has no parameters or
#             use partial if first n parameters match
#             Default: undef
#
define keepalived::vrrp::track_process (
  String[1] $proc_name,
  Optional[Integer[0]] $weight   = undef,
  Integer[0] $quorum             = 1,
  Optional[Integer[0]] $delay    = undef,
  Boolean $full_command          = false,
  Optional[Enum['initial','partial']] $param_match = undef
) {
  concat::fragment { "keepalived.conf_vrrp_track_process_${proc_name}":
    target  => "${keepalived::config_dir}/keepalived.conf",
    content => epp('keepalived/vrrp_track_process.epp', {
        'name'         => $name,
        'proc_name'    => $proc_name,
        'weight'       => $weight,
        'quorum'       => $quorum,
        'delay'        => $delay,
        'full_command' => $full_command,
        'param_match'  => $param_match
    }),
    order   => '020',
  }
}
