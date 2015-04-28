require 'spec_helper'
describe 'nagiosglance' do

  context 'with defaults for all parameters' do
    it { should contain_class('nagiosglance') }
  end
end
