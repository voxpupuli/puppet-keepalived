# Changelog

All notable changes to this project will be documented in this file.
Each new release typically also includes the latest modulesync defaults.
These should not affect the functionality of the module.

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

- Review acceptance tests [\#156](https://github.com/voxpupuli/puppet-keepalived/issues/156)
- Target Concat\_file with path or title '/keepalived.conf' or tag '\_keepalived.conf not found in the catalog [\#143](https://github.com/voxpupuli/puppet-keepalived/issues/143)
- forge version 1.2.5 is outdated [\#131](https://github.com/voxpupuli/puppet-keepalived/issues/131)
- Concat issue [\#106](https://github.com/voxpupuli/puppet-keepalived/issues/106)
- Replace validate functions with data types [\#159](https://github.com/voxpupuli/puppet-keepalived/issues/159)
- No changelog available [\#148](https://github.com/voxpupuli/puppet-keepalived/issues/148)

**Merged pull requests:**

- \* Allow user and group in vrrp::script [\#149](https://github.com/voxpupuli/puppet-keepalived/pull/149) ([SpoonOne](https://github.com/SpoonOne))
- Add badges [\#166](https://github.com/voxpupuli/puppet-keepalived/pull/166) ([alexjfisher](https://github.com/alexjfisher))
- Replace `create\_resources` with iteration [\#165](https://github.com/voxpupuli/puppet-keepalived/pull/165) ([alexjfisher](https://github.com/alexjfisher))
- Fix Github License detection [\#164](https://github.com/voxpupuli/puppet-keepalived/pull/164) ([alexjfisher](https://github.com/alexjfisher))
- Allow latest concat/stdlib and bump minimum versions [\#160](https://github.com/voxpupuli/puppet-keepalived/pull/160) ([alexjfisher](https://github.com/alexjfisher))
- Enable beaker tests and drop Debian 6 support [\#157](https://github.com/voxpupuli/puppet-keepalived/pull/157) ([Dan33l](https://github.com/Dan33l))
- some README cleanup [\#155](https://github.com/voxpupuli/puppet-keepalived/pull/155) ([Dan33l](https://github.com/Dan33l))
- Rubocop Fixes [\#154](https://github.com/voxpupuli/puppet-keepalived/pull/154) ([alexjfisher](https://github.com/alexjfisher))
- clean up of metadata.json [\#152](https://github.com/voxpupuli/puppet-keepalived/pull/152) ([Dan33l](https://github.com/Dan33l))

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
