require 'spec_helper.rb'
require 'shared/default.rb'

context 'libtokyocabinet queue-type' do
  describe process('gearmand') do
    its(:args) { should match(/--queue-type=libtokyocabinet/) }
  end

  describe file("#{$node['gearman']['libtokyocabinet']['file']}") do
    it { should exist }
    it { should be_file }
  end
end
