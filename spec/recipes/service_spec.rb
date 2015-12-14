require_relative '../spec_helper.rb'

# TODO: Add tests for subscribing to the correct file(s)
describe 'gearman::service' do
  let(:chef_run) { ChefSpec::SoloRunner.new.converge(described_recipe) }

  it 'includes gearman::config' do
    expect(chef_run).to include_recipe('gearman::config')
  end

  it 'enables and runs gearmand' do
    expect(chef_run).to enable_service('gearman-job-server')
    expect(chef_run).to start_service('gearman-job-server')
  end

  context 'Ubuntu 14.04' do
    let(:chef_run) do
      ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '14.04').converge(described_recipe)
    end
    let(:systemd_daemon_reload) { chef_run.execute('systemd-daemon-reload') }

    it 'should not daemon-reload systemd' do
      expect(chef_run).to_not run_execute('systemd-daemon-reload')
    end

    it 'should not subscribe to template[gearmand-init]' do
      expect(systemd_daemon_reload).to_not subscribe_to('template[gearmand-init]')
    end
  end

  context 'Debian 8.1' do
    let(:chef_run) do
      ChefSpec::SoloRunner.new(platform: 'debian', version: '8.1').converge(described_recipe)
    end
    let(:systemd_daemon_reload) { chef_run.execute('systemd-daemon-reload') }

    it 'should daemon-reload systemd' do
      expect(chef_run).to run_execute('systemd-daemon-reload')
    end
  end
end
