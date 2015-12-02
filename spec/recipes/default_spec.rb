require_relative '../spec_helper.rb'

describe 'gearman-job-server::default' do
  let(:chef_run) { ChefSpec::SoloRunner.new.converge(described_recipe) }

  %w(
    gearman-job-server::install
    gearman-job-server::config
    gearman-job-server::service
  ).each do |recipe|
    it "includes recipe #{recipe}" do
      expect(chef_run).to include_recipe(recipe)
    end
  end
end
