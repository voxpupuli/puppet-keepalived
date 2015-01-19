require 'spec_helper_acceptance'

describe 'keepalived class' do

  context 'default parameters' do
    it 'should work with no errors' do
      pp = <<-EOS
      class {'keepalived':}
      ->
      notify{"Keepalived version was: $keepalived_version":}
      EOS

      apply_manifest(pp, :catch_failures => true)
      apply_manifest(pp, :catch_failures => true) do |r|
        expect(r.stdout).to match(/Keepalived version was: (\d.\d.\d)/)
      end
    end
  end
end
