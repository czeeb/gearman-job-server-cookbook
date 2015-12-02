require_relative '../spec_helper.rb'

describe 'gearman-job-server::config' do
  let(:chef_run) { ChefSpec::SoloRunner.new.converge(described_recipe) }

end

