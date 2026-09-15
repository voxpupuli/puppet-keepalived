# frozen_string_literal: true

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
Facter.add('keepalived_version') do
  confine { Facter::Core::Execution.which('keepalived') }

  setcode do
    Facter::Core::Execution.execute('keepalived --version 2>&1').lines.first.match(%r{Keepalived v(\d+\.\d+\.\d+) .+})[1]
  end
end
