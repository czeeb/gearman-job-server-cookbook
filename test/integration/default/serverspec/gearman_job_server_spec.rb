require 'serverspec'
require 'pathname'
require 'json'

set :backend, :exec

$node = ::JSON.parse(File.read('/tmp/serverspec/node.json'))

describe 'gearman-job-server' do
  describe port("#{$node['gearman-job-server']['parameters']['port']}") do
    it { should be_listening }
  end
end
