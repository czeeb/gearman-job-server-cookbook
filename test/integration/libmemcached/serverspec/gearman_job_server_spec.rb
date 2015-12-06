require 'spec_helper.rb'
require 'shared/default.rb'

context 'libmemcached queue-type' do
  describe process('gearmand') do
    its(:args) { should match(/--queue-type=libmemcached/) }
  end
end
