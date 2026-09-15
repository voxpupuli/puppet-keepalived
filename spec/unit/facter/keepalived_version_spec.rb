# frozen_string_literal: true

require 'spec_helper'

describe Facter::Util::Fact do
  before do
    Facter.clear
  end

  describe 'keepalived_version' do
    context 'returns keepalived version when keepalived present' do
      it do
        keepalived_version_output = <<~EOS
          Keepalived v2.2.8 (04/04,2023), git commit v2.2.7-154-g292b299e+
        EOS
        allow(Facter::Core::Execution).to receive(:which).with('keepalived')
                                                         .and_return(true)
        allow(Facter::Core::Execution).to receive(:execute).with('keepalived --version 2>&1')
                                                           .and_return(keepalived_version_output)
        expect(Facter.value('keepalived_version')).to eq('2.2.8')
      end
    end

    context 'returns keepalived version when keepalived present and last number more than one digit' do
      it do
        keepalived_version_output = <<~EOS
          Keepalived v1.2.13 (08/07,2014)
        EOS
        allow(Facter::Core::Execution).to receive(:which).with('keepalived')
                                                         .and_return(true)
        allow(Facter::Core::Execution).to receive(:execute).with('keepalived --version 2>&1')
                                                           .and_return(keepalived_version_output)
        expect(Facter.value('keepalived_version')).to eq('1.2.13')
      end
    end

    context 'returns nil when keepalived not present' do
      it do
        allow(Facter::Core::Execution).to receive(:execute)
        allow(Facter::Core::Execution).to receive(:which).with('keepalived')
                                                         .and_return(false)
        expect(Facter.value('keepalived_version')).to be_nil
      end
    end
  end
end
