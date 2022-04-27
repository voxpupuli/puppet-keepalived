# @summary keepalived::vrrp::instance::vrule
#
type Keepalived::Vrrp::Instance::VRule = Struct[{
    Optional[from]     => String,
    Optional[to]       => String,
    Optional[iif]      => String,
    Optional[oif]      => String,
    Optional[priority] => String,
    Optional[table]    => String
}]
