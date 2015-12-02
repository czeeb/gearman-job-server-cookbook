require_relative '../spec_helper.rb'

describe 'gearman-job-server::config' do
  context 'Debian' do
    let(:chef_run) do
      ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '14.04').converge(described_recipe)
    end
    let(:gearman_config) { chef_run.template('/etc/default/gearman-job-server') }

    it 'should create /etc/default/gearman-job-server' do
      expect(chef_run).to create_template('/etc/default/gearman-job-server')
      expect(gearman_config).to notify('service[gearman-job-server]').delayed
    end
  end

  context 'EPEL' do
    let(:chef_run) do
      ChefSpec::SoloRunner.new(platform: 'centos', version: '6.5').converge(described_recipe)
    end
    let(:gearman_config) { chef_run.template('/etc/sysconfig/gearmand') }

    it 'should create /etc/sysconfig/gearmand' do
      expect(chef_run).to create_template('/etc/sysconfig/gearmand')
      expect(gearman_config).to notify('service[gearman-job-server]').delayed
    end
  end
end
