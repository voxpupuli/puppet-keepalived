# @summary keepalived::vrrp::track_process
#
# @param proc_name
#   process name to track
#
# @param weight
#   The weight that should add to the instance.
#
# @param quorum
#   Number of processes to expect running
#
# @param delay
#   Time to delay after process quorum lost before
#   considering process failed (in fractions of second)
#
# @param full_command
#   Match entire process cmdline
#
define keepalived::vrrp::track_process (
  String[1] $proc_name,
  Optional[Integer[0]] $weight   = undef,
  Integer[0] $quorum             = 1,
  Optional[Integer[0]] $delay    = undef,
  Boolean $full_command           = false
) {
  concat::fragment { "keepalived.conf_vrrp_track_process_${proc_name}":
    target  => "${keepalived::config_dir}/keepalived.conf",
    content => epp('keepalived/vrrp_track_process.epp', {
      'name'         => $name,
      'proc_name'    => $proc_name,
      'weight'       => $weight,
      'quorum'       => $quorum,
      'delay'        => $delay,
      'full_command' => $full_command
    }),
    order   => '020',
  }
}
