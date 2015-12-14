require 'spec_helper.rb'
require 'shared/default.rb'

context 'libsqlite3 queue-type' do
  describe process('gearmand') do
    its(:args) { should match(/--queue-type=libsqlite3/) }
  end

  describe file("#{$node['gearman']['libsqlite3']['db']}") do
    it { should exist }
    it { should be_file }
  end
end
