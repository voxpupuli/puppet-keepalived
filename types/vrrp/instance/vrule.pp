# @summary Translates directly to rules to be added as per `ip-rule(8)`
type Keepalived::Vrrp::Instance::VRule = Struct[
  {
    Optional[from]                  => String,
    Optional[to]                    => String,
    Optional[iif]                   => String,
    Optional[oof]                   => String,
    Optional[lookup]                => String,
    Optional[table]                 => String,
    Optional[tos]                   => String,
    Optional[dsfield]               => String,
    Optional[fwmark]                => String,
    Optional[uidrange]              => String,
    Optional[ipproto]               => String,
    Optional[sport]                 => String,
    Optional[dport]                 => String,
    Optional[priority]              => String,
    Optional[preference]            => String,
    Optional[order]                 => String,
    Optional[protocol]              => String,
    Optional[suppress_prefixlength] => String,
    Optional[suppress_ifgroup]      => String,
    Optional[realms]                => String,
    Optional[nat]                   => String,
  }
]
