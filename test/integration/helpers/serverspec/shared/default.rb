describe 'Default gearman-job-server tests' do
  describe port("#{$node['gearman']['parameters']['port']}") do
    it { should be_listening }
  end
end
