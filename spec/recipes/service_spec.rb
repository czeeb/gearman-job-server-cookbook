require_relative '../spec_helper.rb'

# TODO: Add tests for subscribing to the correct file(s)
describe 'gearman::service' do
  let(:chef_run) { ChefSpec::SoloRunner.new.converge(described_recipe) }

  it 'enables and runs gearmand' do
    expect(chef_run).to enable_service('gearman-job-server')
    expect(chef_run).to start_service('gearman-job-server')
  end
end
