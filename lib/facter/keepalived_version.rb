# Fact: keepalived_version
#
# Purpose: get keepalived version
#
# Resolution:
#   Tests for presence of keepalived
#   "keepalived --version" and matches on the tag after 'Keepalived v'
#
# Caveats:
#   none
#
# Notes:
#   None
if Facter::Util::Resolution.which('keepalived')
  Facter.add(:keepalived_version) do
    setcode do
      Facter::Util::Resolution.exec('keepalived --version 2>&1').lines.first.match(/Keepalived v(\d+\.\d+\.\d+) .+/)[1]
    end
  end
end
