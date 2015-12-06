describe 'Default gearman-job-server tests' do
  describe port("#{$node['gearman-job-server']['parameters']['port']}") do
    it { should be_listening }
  end
end
