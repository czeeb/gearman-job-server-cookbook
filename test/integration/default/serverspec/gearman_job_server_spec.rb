require 'serverspec'

set :backend, :exec

describe 'gearman-job-server' do
  describe port(4730) do
    it { should be_listening }
  end
end
