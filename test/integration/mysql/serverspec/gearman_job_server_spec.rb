require 'spec_helper.rb'
require 'shared/default.rb'

context 'mysql queue-type' do
  describe process('gearmand') do
    its(:args) { should match(/--queue-type=mysql/) }
  end
end
