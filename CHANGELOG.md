# Changelog

All notable changes to this project will be documented in this file.
Each new release typically also includes the latest modulesync defaults.
These should not affect the functionality of the module.

## [v5.2.0](https://github.com/voxpupuli/puppet-keepalived/tree/v5.2.0) (2025-05-01)

[Full Changelog](https://github.com/voxpupuli/puppet-keepalived/compare/v5.1.0...v5.2.0)

**Implemented enhancements:**

- metadata.json: Add OpenVox [\#352](https://github.com/voxpupuli/puppet-keepalived/pull/352) ([jstraw](https://github.com/jstraw))
- Add `validate_cmd` for `keepalived.conf` [\#346](https://github.com/voxpupuli/puppet-keepalived/pull/346) ([phihos](https://github.com/phihos))
- Add support for `lvs_sync_daemon` [\#342](https://github.com/voxpupuli/puppet-keepalived/pull/342) ([dlucredativ](https://github.com/dlucredativ))
- allow hiera to define `keepalived::global_defs` [\#340](https://github.com/voxpupuli/puppet-keepalived/pull/340) ([ppickfor](https://github.com/ppickfor))
- Allow Sensitive `$auth_pass` [\#339](https://github.com/voxpupuli/puppet-keepalived/pull/339) ([cocker-cc](https://github.com/cocker-cc))

## [v5.1.0](https://github.com/voxpupuli/puppet-keepalived/tree/v5.1.0) (2024-04-16)

[Full Changelog](https://github.com/voxpupuli/puppet-keepalived/compare/v5.0.0...v5.1.0)

**Implemented enhancements:**

- Add OracleLinux Support [\#334](https://github.com/voxpupuli/puppet-keepalived/pull/334) ([bastelfreak](https://github.com/bastelfreak))
- Add Rocky Support [\#333](https://github.com/voxpupuli/puppet-keepalived/pull/333) ([bastelfreak](https://github.com/bastelfreak))
- Add AlmaLinux support [\#332](https://github.com/voxpupuli/puppet-keepalived/pull/332) ([bastelfreak](https://github.com/bastelfreak))

**Fixed bugs:**

- service: hasrestart/hasstatus: use Puppet defaults [\#335](https://github.com/voxpupuli/puppet-keepalived/pull/335) ([bastelfreak](https://github.com/bastelfreak))
- Gentoo/Debian: Enable hasstatus for service [\#331](https://github.com/voxpupuli/puppet-keepalived/pull/331) ([bastelfreak](https://github.com/bastelfreak))

## [v5.0.0](https://github.com/voxpupuli/puppet-keepalived/tree/v5.0.0) (2024-04-02)

[Full Changelog](https://github.com/voxpupuli/puppet-keepalived/compare/v4.1.0...v5.0.0)

**Breaking changes:**

- vrrp::instance::track\_script: Enforce Array datatype 2 [\#329](https://github.com/voxpupuli/puppet-keepalived/pull/329) ([bastelfreak](https://github.com/bastelfreak))
- Drop Debian 10 support [\#327](https://github.com/voxpupuli/puppet-keepalived/pull/327) ([Valantin](https://github.com/Valantin))
- vrrp::instance: virtual\_rules: Enforce Array datatype [\#321](https://github.com/voxpupuli/puppet-keepalived/pull/321) ([bastelfreak](https://github.com/bastelfreak))
- vrrp::instance: track\_interface: Enforce Array datatype [\#320](https://github.com/voxpupuli/puppet-keepalived/pull/320) ([bastelfreak](https://github.com/bastelfreak))
- vrrp::instance: track\_script: Enforce Array datatype [\#319](https://github.com/voxpupuli/puppet-keepalived/pull/319) ([bastelfreak](https://github.com/bastelfreak))

**Implemented enhancements:**

- Add Ubuntu 22.04 support [\#326](https://github.com/voxpupuli/puppet-keepalived/pull/326) ([Valantin](https://github.com/Valantin))
- Add EL9 support [\#299](https://github.com/voxpupuli/puppet-keepalived/pull/299) ([bastelfreak](https://github.com/bastelfreak))
- Add Debian 12 support [\#296](https://github.com/voxpupuli/puppet-keepalived/pull/296) ([bastelfreak](https://github.com/bastelfreak))

**Fixed bugs:**

- vrrp\_instance::track\_script: Fix Datatype-Mismatch [\#322](https://github.com/voxpupuli/puppet-keepalived/pull/322) ([cocker-cc](https://github.com/cocker-cc))

## [v4.1.0](https://github.com/voxpupuli/puppet-keepalived/tree/v4.1.0) (2024-03-12)

[Full Changelog](https://github.com/voxpupuli/puppet-keepalived/compare/v4.0.0...v4.1.0)

**Implemented enhancements:**

- vrrp::instance: track\_script: Add datatype [\#317](https://github.com/voxpupuli/puppet-keepalived/pull/317) ([bastelfreak](https://github.com/bastelfreak))
- vrrp::instance: track\_process: Switch default undef-\>\[\] [\#316](https://github.com/voxpupuli/puppet-keepalived/pull/316) ([bastelfreak](https://github.com/bastelfreak))
- vrrp::instance: {vrrp\_,}track\_file: Switch default undef-\>\[\] [\#315](https://github.com/voxpupuli/puppet-keepalived/pull/315) ([bastelfreak](https://github.com/bastelfreak))
- Add support for track\_process to vrrp\_sync\_group [\#313](https://github.com/voxpupuli/puppet-keepalived/pull/313) ([imp-](https://github.com/imp-))
- Add support for the init\_fail parameter to keepalived::vrrp::script [\#284](https://github.com/voxpupuli/puppet-keepalived/pull/284) ([ggoas-interop](https://github.com/ggoas-interop))

**Fixed bugs:**

- \(\#310\) {vrrp\_,}track\_file: Enforce only String datatype  [\#312](https://github.com/voxpupuli/puppet-keepalived/pull/312) ([tuxmea](https://github.com/tuxmea))
- Replace all occurrences of illegal chars in the name var [\#291](https://github.com/voxpupuli/puppet-keepalived/pull/291) ([gerases](https://github.com/gerases))

## [v4.0.0](https://github.com/voxpupuli/puppet-keepalived/tree/v4.0.0) (2024-01-19)

[Full Changelog](https://github.com/voxpupuli/puppet-keepalived/compare/v3.6.0...v4.0.0)

**Breaking changes:**

- Drop EoL Ubuntu 16.04 & 18.04 support [\#294](https://github.com/voxpupuli/puppet-keepalived/pull/294) ([bastelfreak](https://github.com/bastelfreak))
- Drop EoL Debian 9 support [\#292](https://github.com/voxpupuli/puppet-keepalived/pull/292) ([bastelfreak](https://github.com/bastelfreak))
- Drop Puppet 6 support [\#286](https://github.com/voxpupuli/puppet-keepalived/pull/286) ([bastelfreak](https://github.com/bastelfreak))

**Implemented enhancements:**

- Add EL8 support [\#298](https://github.com/voxpupuli/puppet-keepalived/pull/298) ([bastelfreak](https://github.com/bastelfreak))
- Add `terminate_delay` and `fork_delay` parameters to `keepalived::vrrp::track_process` [\#295](https://github.com/voxpupuli/puppet-keepalived/pull/295) ([trefzer](https://github.com/trefzer))
- puppetlabs/concat: Allow 8.x & 9.x [\#293](https://github.com/voxpupuli/puppet-keepalived/pull/293) ([bastelfreak](https://github.com/bastelfreak))
- Add Puppet 8 support [\#289](https://github.com/voxpupuli/puppet-keepalived/pull/289) ([bastelfreak](https://github.com/bastelfreak))
- puppetlabs/stdlib: Allow 9.x [\#288](https://github.com/voxpupuli/puppet-keepalived/pull/288) ([bastelfreak](https://github.com/bastelfreak))
- Improve track\_file handling and enable vrrp\_track\_file for keepalived \< 2.1.0 [\#282](https://github.com/voxpupuli/puppet-keepalived/pull/282) ([bluthg](https://github.com/bluthg))

**Fixed bugs:**

- Dashes in VRRP instance names can cause fragment ordering troubles [\#302](https://github.com/voxpupuli/puppet-keepalived/issues/302)
- Improve collect\_unicast\_peers [\#305](https://github.com/voxpupuli/puppet-keepalived/pull/305) ([frank-f](https://github.com/frank-f))
- Avoid messing up fragment ordering if instance name contains dashes [\#303](https://github.com/voxpupuli/puppet-keepalived/pull/303) ([frank-f](https://github.com/frank-f))

**Merged pull requests:**

- Remove legacy top-scope syntax [\#300](https://github.com/voxpupuli/puppet-keepalived/pull/300) ([smortex](https://github.com/smortex))

## [v3.6.0](https://github.com/voxpupuli/puppet-keepalived/tree/v3.6.0) (2023-01-27)

[Full Changelog](https://github.com/voxpupuli/puppet-keepalived/compare/v3.5.0...v3.6.0)

**Implemented enhancements:**

- add parameter use\_vmac\_addr to VRRP instance [\#277](https://github.com/voxpupuli/puppet-keepalived/pull/277) ([moritz-makandra](https://github.com/moritz-makandra))
- Add support for track\_interface option to vrrp\_sync\_group [\#264](https://github.com/voxpupuli/puppet-keepalived/pull/264) ([imp-](https://github.com/imp-))

## [v3.5.0](https://github.com/voxpupuli/puppet-keepalived/tree/v3.5.0) (2022-10-25)

[Full Changelog](https://github.com/voxpupuli/puppet-keepalived/compare/v3.4.0...v3.5.0)

**Implemented enhancements:**

- add option to set a vrrp track file [\#275](https://github.com/voxpupuli/puppet-keepalived/pull/275) ([tuxmea](https://github.com/tuxmea))
- add global option vrrp\_min\_garp [\#273](https://github.com/voxpupuli/puppet-keepalived/pull/273) ([moritz-makandra](https://github.com/moritz-makandra))
- Add support for promote\_secondaries option [\#271](https://github.com/voxpupuli/puppet-keepalived/pull/271) ([koleo](https://github.com/koleo))

**Fixed bugs:**

- Keepalived::Vrrp::Instance::VRule: Add missing vrule fields [\#272](https://github.com/voxpupuli/puppet-keepalived/pull/272) ([towo](https://github.com/towo))
- fix template rendering with vrrp\_priority and vrrp\_fifo\_\* options [\#270](https://github.com/voxpupuli/puppet-keepalived/pull/270) ([ymartin-ovh](https://github.com/ymartin-ovh))

## [v3.4.0](https://github.com/voxpupuli/puppet-keepalived/tree/v3.4.0) (2022-06-20)

[Full Changelog](https://github.com/voxpupuli/puppet-keepalived/compare/v3.3.0...v3.4.0)

**Implemented enhancements:**

- Add support of vrrp\_notify\_fifo\* [\#267](https://github.com/voxpupuli/puppet-keepalived/pull/267) ([ymartin-ovh](https://github.com/ymartin-ovh))
- support for vrrp\_check\_unicast\_src option [\#265](https://github.com/voxpupuli/puppet-keepalived/pull/265) ([robmbrooks](https://github.com/robmbrooks))
- Add support for dynamic\_interfaces in global\_defs section [\#263](https://github.com/voxpupuli/puppet-keepalived/pull/263) ([imp-](https://github.com/imp-))

## [v3.3.0](https://github.com/voxpupuli/puppet-keepalived/tree/v3.3.0) (2022-04-19)

[Full Changelog](https://github.com/voxpupuli/puppet-keepalived/compare/v3.2.0...v3.3.0)

**Implemented enhancements:**

- vrrp\_version and max\_auto\_priority global parameters [\#261](https://github.com/voxpupuli/puppet-keepalived/pull/261) ([ymartin-ovh](https://github.com/ymartin-ovh))
- Add support for mh lb\_algo [\#260](https://github.com/voxpupuli/puppet-keepalived/pull/260) ([MrFreezeex](https://github.com/MrFreezeex))
- Add vrrp\_garp\_master\_{delay, refresh, refresh\_repeat} tunables in globaldefs [\#259](https://github.com/voxpupuli/puppet-keepalived/pull/259) ([ymartin-ovh](https://github.com/ymartin-ovh))
- Allow to include external keepalived config fragment [\#258](https://github.com/voxpupuli/puppet-keepalived/pull/258) ([ymartin-ovh](https://github.com/ymartin-ovh))
- Keepalived processes behaviour are tunable via globaldefs: prio, rt\_prio, no\_swap [\#256](https://github.com/voxpupuli/puppet-keepalived/pull/256) ([ymartin-ovh](https://github.com/ymartin-ovh))
- Add Debian 10/11 and Ubuntu 20.04 support [\#255](https://github.com/voxpupuli/puppet-keepalived/pull/255) ([towo](https://github.com/towo))
- Add track vrrp scripts to vrrp\_sync\_groups [\#254](https://github.com/voxpupuli/puppet-keepalived/pull/254) ([KeithWard](https://github.com/KeithWard))
- Add the possibility to manage the package outside the module [\#249](https://github.com/voxpupuli/puppet-keepalived/pull/249) ([kibidouil](https://github.com/kibidouil))

**Merged pull requests:**

- vrrp\_instance template: Remove forced newlines [\#252](https://github.com/voxpupuli/puppet-keepalived/pull/252) ([Henrik-Hansson](https://github.com/Henrik-Hansson))
- fix README: priority and virtual\_router\_id should be Integer. [\#251](https://github.com/voxpupuli/puppet-keepalived/pull/251) ([trefzer](https://github.com/trefzer))

## [v3.2.0](https://github.com/voxpupuli/puppet-keepalived/tree/v3.2.0) (2021-10-02)

[Full Changelog](https://github.com/voxpupuli/puppet-keepalived/compare/v3.1.0...v3.2.0)

**Implemented enhancements:**

- Add support for vrrp\_startup\_delay option [\#248](https://github.com/voxpupuli/puppet-keepalived/pull/248) ([fklajn](https://github.com/fklajn))
- Add enable\_dbus option [\#242](https://github.com/voxpupuli/puppet-keepalived/pull/242) ([aagor](https://github.com/aagor))
- Use Puppet-Datatype Sensitive for $auth\_pass [\#241](https://github.com/voxpupuli/puppet-keepalived/pull/241) ([cocker-cc](https://github.com/cocker-cc))
- create puppet strings based reference docs [\#209](https://github.com/voxpupuli/puppet-keepalived/pull/209) ([your1p](https://github.com/your1p))

**Closed issues:**

- Create puppet-strings based reference docs [\#158](https://github.com/voxpupuli/puppet-keepalived/issues/158)

**Merged pull requests:**

- Allow stdlib 8.0.0 [\#245](https://github.com/voxpupuli/puppet-keepalived/pull/245) ([smortex](https://github.com/smortex))
- Allow virtual\_ipaddress\_excluded to be a string [\#244](https://github.com/voxpupuli/puppet-keepalived/pull/244) ([aagor](https://github.com/aagor))
- Fix incorrect documentation [\#243](https://github.com/voxpupuli/puppet-keepalived/pull/243) ([aagor](https://github.com/aagor))

## [v3.1.0](https://github.com/voxpupuli/puppet-keepalived/tree/v3.1.0) (2021-05-21)

[Full Changelog](https://github.com/voxpupuli/puppet-keepalived/compare/v3.0.0...v3.1.0)

**Implemented enhancements:**

- add parameter param\_match for VRRP tracking processes [\#237](https://github.com/voxpupuli/puppet-keepalived/pull/237) ([tobiWu](https://github.com/tobiWu))

**Fixed bugs:**

- make unicast-peer resource-name unique by adding the instance-name [\#230](https://github.com/voxpupuli/puppet-keepalived/pull/230) ([unki](https://github.com/unki))

## [v3.0.0](https://github.com/voxpupuli/puppet-keepalived/tree/v3.0.0) (2021-04-03)

[Full Changelog](https://github.com/voxpupuli/puppet-keepalived/compare/v2.2.0...v3.0.0)

**Breaking changes:**

- Drop Debian 8 support [\#235](https://github.com/voxpupuli/puppet-keepalived/pull/235) ([bastelfreak](https://github.com/bastelfreak))
- Drop Puppet 5 support; add Puppet 7 support [\#234](https://github.com/voxpupuli/puppet-keepalived/pull/234) ([bastelfreak](https://github.com/bastelfreak))

**Implemented enhancements:**

- Enable Debian 9 support [\#233](https://github.com/voxpupuli/puppet-keepalived/pull/233) ([bastelfreak](https://github.com/bastelfreak))
- puppetlabs/concat: Allow 7.x / puppetlabs/stdlib: Allow 7.x [\#232](https://github.com/voxpupuli/puppet-keepalived/pull/232) ([bastelfreak](https://github.com/bastelfreak))
- add vrrp\_garp\_master\_refresh / vrrp\_garp\_lower\_prio\_delay params [\#206](https://github.com/voxpupuli/puppet-keepalived/pull/206) ([a-dekker](https://github.com/a-dekker))
- add support for virtual\_rules [\#199](https://github.com/voxpupuli/puppet-keepalived/pull/199) ([derJD](https://github.com/derJD))

**Fixed bugs:**

- Fix `Keepalived::Vrrp::Instance::VRule` syntax [\#200](https://github.com/voxpupuli/puppet-keepalived/pull/200) ([cocker-cc](https://github.com/cocker-cc))

**Closed issues:**

- `dev` is set on `virtual_ipaddress` when `use_vmac` is enabled [\#215](https://github.com/voxpupuli/puppet-keepalived/issues/215)
- support of additional parameters [\#205](https://github.com/voxpupuli/puppet-keepalived/issues/205)
- forge version of module vs current master - vrrp script timeouts [\#111](https://github.com/voxpupuli/puppet-keepalived/issues/111)

**Merged pull requests:**

- Enable automatic unicast configuration with exported resources - pass tests [\#227](https://github.com/voxpupuli/puppet-keepalived/pull/227) ([daaang](https://github.com/daaang))
- Drop EL6 support [\#226](https://github.com/voxpupuli/puppet-keepalived/pull/226) ([ekohl](https://github.com/ekohl))
- Resolve puppet-lint notices [\#220](https://github.com/voxpupuli/puppet-keepalived/pull/220) ([jcpunk](https://github.com/jcpunk))
- modulesync 3.0.0 & puppet-lint updates [\#218](https://github.com/voxpupuli/puppet-keepalived/pull/218) ([bastelfreak](https://github.com/bastelfreak))
- use hiera data in module instead of params.pp [\#210](https://github.com/voxpupuli/puppet-keepalived/pull/210) ([Dan33l](https://github.com/Dan33l))
- Use voxpupuli-acceptance [\#208](https://github.com/voxpupuli/puppet-keepalived/pull/208) ([ekohl](https://github.com/ekohl))
- Use contain for sub classes in this module [\#202](https://github.com/voxpupuli/puppet-keepalived/pull/202) ([bastelfreak](https://github.com/bastelfreak))

## [v2.2.0](https://github.com/voxpupuli/puppet-keepalived/tree/v2.2.0) (2019-10-22)

[Full Changelog](https://github.com/voxpupuli/puppet-keepalived/compare/v2.1.0...v2.2.0)

**Implemented enhancements:**

- Add support for sh-port and sh-fallback flags to lvs virtual servers [\#198](https://github.com/voxpupuli/puppet-keepalived/pull/198) ([hkbakke](https://github.com/hkbakke))
- Add notify\_script\_master\_rx\_lower\_pri option to the module [\#195](https://github.com/voxpupuli/puppet-keepalived/pull/195) ([salindaliyanage](https://github.com/salindaliyanage))
- Support for higher\_prio\_send\_advert  and garp\_lower\_prio\_repeat  [\#194](https://github.com/voxpupuli/puppet-keepalived/pull/194) ([foosinn](https://github.com/foosinn))
- LVS hiera support [\#190](https://github.com/voxpupuli/puppet-keepalived/pull/190) ([7matd7](https://github.com/7matd7))

**Fixed bugs:**

- virtual\_ipaddress should be on vrrp interface if use\_vmac is set [\#186](https://github.com/voxpupuli/puppet-keepalived/pull/186) ([saz](https://github.com/saz))

**Closed issues:**

- Not able to set sh-port and sh-fallback flags in virtual\_server [\#192](https://github.com/voxpupuli/puppet-keepalived/issues/192)
- Add Ubuntu to Metadata [\#175](https://github.com/voxpupuli/puppet-keepalived/issues/175)
- Hiera lookups and this module [\#116](https://github.com/voxpupuli/puppet-keepalived/issues/116)

**Merged pull requests:**

- Add Ubuntu 16.04 and 18.04 to list of supported OSes [\#188](https://github.com/voxpupuli/puppet-keepalived/pull/188) ([alexjfisher](https://github.com/alexjfisher))
- Add CentOS 7 to list of supported OSes [\#187](https://github.com/voxpupuli/puppet-keepalived/pull/187) ([alexjfisher](https://github.com/alexjfisher))

## [v2.1.0](https://github.com/voxpupuli/puppet-keepalived/tree/v2.1.0) (2019-06-09)

[Full Changelog](https://github.com/voxpupuli/puppet-keepalived/compare/v2.0.0...v2.1.0)

**Implemented enhancements:**

- Please add support for "native\_ipv6" vrrp\_instance statement [\#183](https://github.com/voxpupuli/puppet-keepalived/issues/183)
- add support for native\_ipv6 in vrrp instances [\#184](https://github.com/voxpupuli/puppet-keepalived/pull/184) ([sigbjorntux](https://github.com/sigbjorntux))
- feat: add quorum\_up and quorum\_down in virtual\_server [\#174](https://github.com/voxpupuli/puppet-keepalived/pull/174) ([rotulet](https://github.com/rotulet))
- add keepalived vrrp track\_process support w/tests [\#172](https://github.com/voxpupuli/puppet-keepalived/pull/172) ([jontow](https://github.com/jontow))

**Fixed bugs:**

- Problem with keepalived::vrrp::track\_process fullcommand [\#179](https://github.com/voxpupuli/puppet-keepalived/issues/179)
- Allow puppetlabs/concat 6.x, puppetlabs/stdlib 6.x [\#182](https://github.com/voxpupuli/puppet-keepalived/pull/182) ([dhoppe](https://github.com/dhoppe))
- Change the fullcommand parameter to full\_command for keepalived::vrrp::track\_process [\#180](https://github.com/voxpupuli/puppet-keepalived/pull/180) ([fduranti](https://github.com/fduranti))

**Closed issues:**

- Fix wrong warning [\#141](https://github.com/voxpupuli/puppet-keepalived/issues/141)

**Merged pull requests:**

- remove leading colons from variables [\#176](https://github.com/voxpupuli/puppet-keepalived/pull/176) ([Dan33l](https://github.com/Dan33l))
- use rspec-puppet-facts [\#173](https://github.com/voxpupuli/puppet-keepalived/pull/173) ([Dan33l](https://github.com/Dan33l))
- Support for metric argument in vrrp\_instancevirtual\_routes [\#128](https://github.com/voxpupuli/puppet-keepalived/pull/128) ([KrzysztofHajdamowicz](https://github.com/KrzysztofHajdamowicz))

## [v2.0.0](https://github.com/voxpupuli/puppet-keepalived/tree/v2.0.0) (2019-03-18)

[Full Changelog](https://github.com/voxpupuli/puppet-keepalived/compare/1.3.0...v2.0.0)

This is the first release since the module was migrated to the [Vox Pupuli](https://voxpupuli.org/) [`puppet`](https://forge.puppet.com/puppet) namespace.

**Breaking changes:**

- Use data types instead of validate functions [\#163](https://github.com/voxpupuli/puppet-keepalived/pull/163) ([alexjfisher](https://github.com/alexjfisher))
- Drop support for Puppet 3, Puppet 4 and Debian 7 [\#162](https://github.com/voxpupuli/puppet-keepalived/pull/162) ([alexjfisher](https://github.com/alexjfisher))

**Closed issues:**

- Replace validate functions with data types [\#159](https://github.com/voxpupuli/puppet-keepalived/issues/159)
- Review acceptance tests [\#156](https://github.com/voxpupuli/puppet-keepalived/issues/156)
- No changelog available [\#148](https://github.com/voxpupuli/puppet-keepalived/issues/148)
- Target Concat\_file with path or title '/keepalived.conf' or tag '\_keepalived.conf not found in the catalog [\#143](https://github.com/voxpupuli/puppet-keepalived/issues/143)
- forge version 1.2.5 is outdated [\#131](https://github.com/voxpupuli/puppet-keepalived/issues/131)
- Concat issue [\#106](https://github.com/voxpupuli/puppet-keepalived/issues/106)

**Merged pull requests:**

- Add badges [\#166](https://github.com/voxpupuli/puppet-keepalived/pull/166) ([alexjfisher](https://github.com/alexjfisher))
- Replace `create_resources` with iteration [\#165](https://github.com/voxpupuli/puppet-keepalived/pull/165) ([alexjfisher](https://github.com/alexjfisher))
- Fix Github License detection [\#164](https://github.com/voxpupuli/puppet-keepalived/pull/164) ([alexjfisher](https://github.com/alexjfisher))
- Allow latest concat/stdlib and bump minimum versions [\#160](https://github.com/voxpupuli/puppet-keepalived/pull/160) ([alexjfisher](https://github.com/alexjfisher))
- Enable beaker tests and drop Debian 6 support [\#157](https://github.com/voxpupuli/puppet-keepalived/pull/157) ([Dan33l](https://github.com/Dan33l))
- some README cleanup [\#155](https://github.com/voxpupuli/puppet-keepalived/pull/155) ([Dan33l](https://github.com/Dan33l))
- Rubocop Fixes [\#154](https://github.com/voxpupuli/puppet-keepalived/pull/154) ([alexjfisher](https://github.com/alexjfisher))
- clean up of metadata.json [\#152](https://github.com/voxpupuli/puppet-keepalived/pull/152) ([Dan33l](https://github.com/Dan33l))
- \* Allow user and group in vrrp::script [\#149](https://github.com/voxpupuli/puppet-keepalived/pull/149) ([SpoonOne](https://github.com/SpoonOne))

## [1.3.0](https://github.com/voxpupuli/puppet-keepalived/tree/1.3.0) (2018-09-06)

[Full Changelog](https://github.com/voxpupuli/puppet-keepalived/compare/1.2.5...1.3.0)

**Closed issues:**

- VIP for sandby ip ? [\#135](https://github.com/voxpupuli/puppet-keepalived/issues/135)
- Add "script\_user" and "enable\_script\_security" options in global\_defs class [\#130](https://github.com/voxpupuli/puppet-keepalived/issues/130)
- keepalived::vrrp::instance priority should support the value 255. [\#107](https://github.com/voxpupuli/puppet-keepalived/issues/107)

**Merged pull requests:**

- Fix 130 [\#134](https://github.com/voxpupuli/puppet-keepalived/pull/134) ([duritong](https://github.com/duritong))
- Avoid newline \(and with this a refresh of service\) for existing configs [\#115](https://github.com/voxpupuli/puppet-keepalived/pull/115) ([robertvargason](https://github.com/robertvargason))

## [1.2.5](https://github.com/voxpupuli/puppet-keepalived/tree/1.2.5) (2016-09-23)

[Full Changelog](https://github.com/voxpupuli/puppet-keepalived/compare/1.2.4...1.2.5)

**Closed issues:**

- $ensure parameter to concat::fragment is deprecated [\#112](https://github.com/voxpupuli/puppet-keepalived/issues/112)
- Configuration option to use VMAC feature [\#108](https://github.com/voxpupuli/puppet-keepalived/issues/108)
- New release? [\#96](https://github.com/voxpupuli/puppet-keepalived/issues/96)
- misplaced curly brace [\#75](https://github.com/voxpupuli/puppet-keepalived/issues/75)

**Merged pull requests:**

- Support testing on Rubies \< 2.0.0 [\#113](https://github.com/voxpupuli/puppet-keepalived/pull/113) ([Phil-Friderici](https://github.com/Phil-Friderici))
- Made virtual\_ipaddress optional [\#101](https://github.com/voxpupuli/puppet-keepalived/pull/101) ([iwalz](https://github.com/iwalz))
- simple ordering fix for \#75 [\#97](https://github.com/voxpupuli/puppet-keepalived/pull/97) ([gattebury](https://github.com/gattebury))

## [1.2.4](https://github.com/voxpupuli/puppet-keepalived/tree/1.2.4) (2016-02-22)

[Full Changelog](https://github.com/voxpupuli/puppet-keepalived/compare/1.2.3...1.2.4)

**Closed issues:**

- Cannot add 2 ip's, each on different interfaces [\#84](https://github.com/voxpupuli/puppet-keepalived/issues/84)
- Comparison of: String \< Integer, is not possible [\#79](https://github.com/voxpupuli/puppet-keepalived/issues/79)

**Merged pull requests:**

- Extend hiera support [\#94](https://github.com/voxpupuli/puppet-keepalived/pull/94) ([mrdrup](https://github.com/mrdrup))
- Added mcast\_src\_ip option [\#93](https://github.com/voxpupuli/puppet-keepalived/pull/93) ([jkroepke](https://github.com/jkroepke))
- Keepalived should be restarted on Concat changes, not File [\#92](https://github.com/voxpupuli/puppet-keepalived/pull/92) ([ernetas](https://github.com/ernetas))
- future parser: removed Class\[ 'keepalived' \] [\#90](https://github.com/voxpupuli/puppet-keepalived/pull/90) ([hggh](https://github.com/hggh))
- Remove duplicate class parameter [\#89](https://github.com/voxpupuli/puppet-keepalived/pull/89) ([SanderKnape](https://github.com/SanderKnape))
- Add instruction for hiera usage [\#87](https://github.com/voxpupuli/puppet-keepalived/pull/87) ([occelebi](https://github.com/occelebi))
- Add hiera support [\#86](https://github.com/voxpupuli/puppet-keepalived/pull/86) ([occelebi](https://github.com/occelebi))

## [1.2.3](https://github.com/voxpupuli/puppet-keepalived/tree/1.2.3) (2015-11-06)

[Full Changelog](https://github.com/voxpupuli/puppet-keepalived/compare/1.2.2...1.2.3)

## [1.2.2](https://github.com/voxpupuli/puppet-keepalived/tree/1.2.2) (2015-11-06)

[Full Changelog](https://github.com/voxpupuli/puppet-keepalived/compare/1.2.1...1.2.2)

**Merged pull requests:**

- Type cast strings to integers for puppet 4 [\#82](https://github.com/voxpupuli/puppet-keepalived/pull/82) ([danieldreier](https://github.com/danieldreier))

## [1.2.1](https://github.com/voxpupuli/puppet-keepalived/tree/1.2.1) (2015-08-04)

[Full Changelog](https://github.com/voxpupuli/puppet-keepalived/compare/1.2.0...1.2.1)

**Closed issues:**

- order parameter contains invalid characters [\#70](https://github.com/voxpupuli/puppet-keepalived/issues/70)

**Merged pull requests:**

- implement use of weight\_real in vrrp\_script [\#74](https://github.com/voxpupuli/puppet-keepalived/pull/74) ([ghost](https://github.com/ghost))

## [1.2.0](https://github.com/voxpupuli/puppet-keepalived/tree/1.2.0) (2015-06-08)

[Full Changelog](https://github.com/voxpupuli/puppet-keepalived/compare/1.1.1...1.2.0)

**Fixed bugs:**

- keepalived\_version fact not working [\#61](https://github.com/voxpupuli/puppet-keepalived/issues/61)

**Closed issues:**

- "Symlinks in modules are unsupported" failure installing 1.1.1 on puppet forge [\#64](https://github.com/voxpupuli/puppet-keepalived/issues/64)

**Merged pull requests:**

- Support broad range of puppet versions and fix tests [\#71](https://github.com/voxpupuli/puppet-keepalived/pull/71) ([duritong](https://github.com/duritong))
- Ignore .project files. [\#69](https://github.com/voxpupuli/puppet-keepalived/pull/69) ([arioch](https://github.com/arioch))
- instance scripts syntax fixed [\#68](https://github.com/voxpupuli/puppet-keepalived/pull/68) ([leftys](https://github.com/leftys))

## [1.1.1](https://github.com/voxpupuli/puppet-keepalived/tree/1.1.1) (2015-02-01)

[Full Changelog](https://github.com/voxpupuli/puppet-keepalived/compare/1.1.0...1.1.1)

## [1.1.0](https://github.com/voxpupuli/puppet-keepalived/tree/1.1.0) (2015-01-19)

[Full Changelog](https://github.com/voxpupuli/puppet-keepalived/compare/1.0.4...1.1.0)

## [1.0.4](https://github.com/voxpupuli/puppet-keepalived/tree/1.0.4) (2015-01-05)

[Full Changelog](https://github.com/voxpupuli/puppet-keepalived/compare/1.0.3...1.0.4)

**Closed issues:**

- Puppet agent 3.7.3 error [\#58](https://github.com/voxpupuli/puppet-keepalived/issues/58)
- Hiera can't feed data to the class directly, only via parameters [\#48](https://github.com/voxpupuli/puppet-keepalived/issues/48)

## [1.0.3](https://github.com/voxpupuli/puppet-keepalived/tree/1.0.3) (2014-12-03)

[Full Changelog](https://github.com/voxpupuli/puppet-keepalived/compare/1.0.2...1.0.3)

## [1.0.2](https://github.com/voxpupuli/puppet-keepalived/tree/1.0.2) (2014-11-21)

[Full Changelog](https://github.com/voxpupuli/puppet-keepalived/compare/1.0.1...1.0.2)

**Implemented enhancements:**

- Reload keepalived on refresh instead of restart [\#52](https://github.com/voxpupuli/puppet-keepalived/issues/52)

## [1.0.1](https://github.com/voxpupuli/puppet-keepalived/tree/1.0.1) (2014-10-28)

[Full Changelog](https://github.com/voxpupuli/puppet-keepalived/compare/1.0.0...1.0.1)

## [1.0.0](https://github.com/voxpupuli/puppet-keepalived/tree/1.0.0) (2014-10-05)

[Full Changelog](https://github.com/voxpupuli/puppet-keepalived/compare/0.1.2...1.0.0)

## [0.1.2](https://github.com/voxpupuli/puppet-keepalived/tree/0.1.2) (2014-09-25)

[Full Changelog](https://github.com/voxpupuli/puppet-keepalived/compare/0.1.1...0.1.2)

**Closed issues:**

- Error: Could not find dependent Exec\[concat\_/etc/keepalived/keepalived.conf\] [\#46](https://github.com/voxpupuli/puppet-keepalived/issues/46)

## [0.1.1](https://github.com/voxpupuli/puppet-keepalived/tree/0.1.1) (2014-08-15)

[Full Changelog](https://github.com/voxpupuli/puppet-keepalived/compare/0.1.0...0.1.1)

## [0.1.0](https://github.com/voxpupuli/puppet-keepalived/tree/0.1.0) (2014-07-30)

[Full Changelog](https://github.com/voxpupuli/puppet-keepalived/compare/0.0.16...0.1.0)

**Closed issues:**

- global\_def [\#43](https://github.com/voxpupuli/puppet-keepalived/issues/43)

## [0.0.16](https://github.com/voxpupuli/puppet-keepalived/tree/0.0.16) (2014-07-08)

[Full Changelog](https://github.com/voxpupuli/puppet-keepalived/compare/0.0.15...0.0.16)

## [0.0.15](https://github.com/voxpupuli/puppet-keepalived/tree/0.0.15) (2014-07-08)

[Full Changelog](https://github.com/voxpupuli/puppet-keepalived/compare/0.0.14...0.0.15)

**Fixed bugs:**

- keepalived::lvs::real\_server options fails when using capital letters [\#38](https://github.com/voxpupuli/puppet-keepalived/issues/38)

**Closed issues:**

- Global\_defs.pp depends on a not found Exec [\#40](https://github.com/voxpupuli/puppet-keepalived/issues/40)

## [0.0.14](https://github.com/voxpupuli/puppet-keepalived/tree/0.0.14) (2014-06-16)

[Full Changelog](https://github.com/voxpupuli/puppet-keepalived/compare/0.0.13...0.0.14)

## [0.0.13](https://github.com/voxpupuli/puppet-keepalived/tree/0.0.13) (2014-05-28)

[Full Changelog](https://github.com/voxpupuli/puppet-keepalived/compare/0.0.12...0.0.13)

## [0.0.12](https://github.com/voxpupuli/puppet-keepalived/tree/0.0.12) (2014-05-22)

[Full Changelog](https://github.com/voxpupuli/puppet-keepalived/compare/0.0.11...0.0.12)

**Closed issues:**

- Puppet Forge Examples Incorrect [\#33](https://github.com/voxpupuli/puppet-keepalived/issues/33)
- Real servers as exported resources not working [\#31](https://github.com/voxpupuli/puppet-keepalived/issues/31)

## [0.0.11](https://github.com/voxpupuli/puppet-keepalived/tree/0.0.11) (2014-05-08)

[Full Changelog](https://github.com/voxpupuli/puppet-keepalived/compare/0.0.10...0.0.11)

## [0.0.10](https://github.com/voxpupuli/puppet-keepalived/tree/0.0.10) (2014-03-13)

[Full Changelog](https://github.com/voxpupuli/puppet-keepalived/compare/0.0.9...0.0.10)

## [0.0.9](https://github.com/voxpupuli/puppet-keepalived/tree/0.0.9) (2014-03-12)

[Full Changelog](https://github.com/voxpupuli/puppet-keepalived/compare/0.0.8...0.0.9)

## [0.0.8](https://github.com/voxpupuli/puppet-keepalived/tree/0.0.8) (2014-02-26)

[Full Changelog](https://github.com/voxpupuli/puppet-keepalived/compare/0.0.7...0.0.8)

## [0.0.7](https://github.com/voxpupuli/puppet-keepalived/tree/0.0.7) (2014-02-18)

[Full Changelog](https://github.com/voxpupuli/puppet-keepalived/compare/0.0.6...0.0.7)

**Closed issues:**

- VirtualIP address not being overwritten on change [\#17](https://github.com/voxpupuli/puppet-keepalived/issues/17)

## [0.0.6](https://github.com/voxpupuli/puppet-keepalived/tree/0.0.6) (2014-02-10)

[Full Changelog](https://github.com/voxpupuli/puppet-keepalived/compare/0.0.5...0.0.6)

## [0.0.5](https://github.com/voxpupuli/puppet-keepalived/tree/0.0.5) (2013-12-09)

[Full Changelog](https://github.com/voxpupuli/puppet-keepalived/compare/0.0.4...0.0.5)

## [0.0.4](https://github.com/voxpupuli/puppet-keepalived/tree/0.0.4) (2013-11-22)

[Full Changelog](https://github.com/voxpupuli/puppet-keepalived/compare/0.0.3...0.0.4)

## [0.0.3](https://github.com/voxpupuli/puppet-keepalived/tree/0.0.3) (2013-10-25)

[Full Changelog](https://github.com/voxpupuli/puppet-keepalived/compare/0.0.1...0.0.3)

**Merged pull requests:**

- Fewer empty lines in vrrp instances [\#4](https://github.com/voxpupuli/puppet-keepalived/pull/4) ([bleach](https://github.com/bleach))

## [0.0.1](https://github.com/voxpupuli/puppet-keepalived/tree/0.0.1) (2013-07-25)

[Full Changelog](https://github.com/voxpupuli/puppet-keepalived/compare/0.0.2...0.0.1)

## [0.0.2](https://github.com/voxpupuli/puppet-keepalived/tree/0.0.2) (2013-07-25)

[Full Changelog](https://github.com/voxpupuli/puppet-keepalived/compare/ddedb70fc5f3a930f5e71a598e0294b9912ba12a...0.0.2)



\* *This Changelog was automatically generated by [github_changelog_generator](https://github.com/github-changelog-generator/github-changelog-generator)*
