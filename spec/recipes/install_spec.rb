require_relative '../spec_helper.rb'

describe 'gearman-job-server::install' do
  let(:chef_run) { ChefSpec::SoloRunner.new.converge(described_recipe) }

  context 'Debian' do
    let(:chef_run) do
      ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '14.04').converge(described_recipe)
    end

    it 'includes the apt cookbook' do
      expect(chef_run).to include_recipe('apt')
    end

    it 'installs gearman job server' do
      expect(chef_run).to install_package('gearman-job-server')
      expect(chef_run).to install_package('gearman-tools')
    end
  end

  context 'EPEL' do
    let(:chef_run) do
      ChefSpec::SoloRunner.new(platform: 'centos', version: '6.5').converge(described_recipe)
    end

    it 'does not include the apt cookbook' do
      expect(chef_run).to_not include_recipe('apt')
    end

    it 'installs gearman job server' do
      expect(chef_run).to install_package('epel-release')
      expect(chef_run).to install_package('gearmand')
    end
  end
end
