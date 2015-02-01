require "spec_helper"

describe Facter::Util::Fact do
  before {
    Facter.clear
    allow(Facter::Util::Resolution).to receive(:exec).with(anything())
  }

  describe "keepalived_version" do
    context 'returns keepalived version when keepalived present' do
      it do
        keepalived_version_output = <<-EOS
Keepalived v1.2.2 (10/03,2013)
        EOS
        allow(Facter::Util::Resolution).to receive(:which).with("keepalived").
          and_return(true)
        allow(Facter::Util::Resolution).to receive(:exec).with("keepalived --version 2>&1").
          and_return(keepalived_version_output)
        Facter.fact(:keepalived_version).value.should == "1.2.2"
      end
    end

    context 'returns keepalived version when keepalived present and last number more than one digit' do
      it do
        keepalived_version_output = <<-EOS
Keepalived v1.2.13 (08/07,2014)
        EOS
        allow(Facter::Util::Resolution).to receive(:which).with("keepalived").
          and_return(true)
        allow(Facter::Util::Resolution).to receive(:exec).with("keepalived --version 2>&1").
          and_return(keepalived_version_output)
        Facter.fact(:keepalived_version).value.should == "1.2.13"
      end
    end

    context 'returns nil when keepalived not present' do
      it do
        allow(Facter::Util::Resolution).to receive(:exec)
        allow(Facter::Util::Resolution).to receive(:which).with("keepalived").
          and_return(false)
        Facter.fact(:keepalived_version).should be_nil
      end
    end
  end
end