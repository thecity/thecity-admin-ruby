require File.join(Dir.pwd, 'spec', 'spec_helper')

describe 'Skill' do

  skill = FactoryGirl.attributes_for(:skill)

  before do
    simulate_connection_to_server
  end

  after do

  end


  context 'with valid params' do
    it 'will have an integer for an id' do
      skill[:id].should be_a(Integer)
    end

    it 'will not have a blank name field' do
      skill[:name].should_not be(nil)
    end
  end
  
  context 'with invalid params' do
    
  end

end


