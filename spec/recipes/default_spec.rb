require_relative '../spec_helper.rb'

describe 'gearman::default' do
  let(:chef_run) { ChefSpec::SoloRunner.new.converge(described_recipe) }

  %w(
    gearman::install
    gearman::config
    gearman::service
  ).each do |recipe|
    it "includes recipe #{recipe}" do
      expect(chef_run).to include_recipe(recipe)
    end
  end
end
