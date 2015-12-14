require_relative '../spec_helper.rb'

describe 'gearman::config' do
  context 'Debian Family' do
    let(:chef_run) do
      ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '14.04').converge(described_recipe)
    end

    it 'should create /etc/default/gearman-job-server' do
      expect(chef_run).to create_template('/etc/default/gearman-job-server')
    end
  end

  context 'EPEL Family' do
    let(:chef_run) do
      ChefSpec::SoloRunner.new(platform: 'centos', version: '6.5').converge(described_recipe)
    end

    it 'should create /etc/sysconfig/gearmand' do
      expect(chef_run).to create_template('/etc/sysconfig/gearmand')
    end

    it 'should not create template[gearmand-init]' do
      expect(chef_run).to_not create_template('gearmand-init')
    end
  end

  context 'Debian 7.8' do
    let(:chef_run) do
      ChefSpec::SoloRunner.new(platform: 'debian', version: '7.8').converge(described_recipe)
    end

    it 'should not create template[gearmand-init]' do
      expect(chef_run).to_not create_template('gearmand-init')
    end
  end

  context 'Debian 8.1' do
    let(:chef_run) do
      ChefSpec::SoloRunner.new(platform: 'debian', version: '8.1').converge(described_recipe)
    end

    it 'should create template[gearmand-init]' do
      expect(chef_run).to create_template('gearmand-init')
    end
  end

  context 'Ubuntu 12.04' do
    let(:chef_run) do
      ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '12.04').converge(described_recipe)
    end

    it 'should create template[gearmand-init]' do
      expect(chef_run).to create_template('gearmand-init')
    end
  end

  context 'Ubuntu 14.04' do
    let(:chef_run) do
      ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '14.04').converge(described_recipe)
    end

    it 'should create template[gearmand-init]' do
      expect(chef_run).to create_template('gearmand-init')
    end
  end
end
