require_relative '../spec_helper.rb'

describe 'gearman-job-server::service' do
  let(:chef_run) { ChefSpec::SoloRunner.new.converge(described_recipe) }

  it 'enables and runs gearman job server' do
    expect(chef_run).to enable_service('gearman-job-server')
  end
end
