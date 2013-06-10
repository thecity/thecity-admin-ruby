require File.join(Dir.pwd, 'spec', 'spec_helper')

describe 'Tag' do

  tag = FactoryGirl.attributes_for(:tag)

  before do
    simulate_connection_to_server
  end

  after do

  end


  context 'with valid params' do
    it 'will have an integer for an id' do
      tag[:id].should be_a(Integer)
    end

    it 'will not have a blank name field' do
      tag[:name].should_not be(nil)
    end
  end
  
  context 'with invalid params' do
    
  end

end


