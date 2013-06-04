require File.join(Dir.pwd, 'spec', 'spec_helper')

describe 'Tag' do

  tag = FactoryGirl.attributes_for(:tag)

  before do
    simulate_connection_to_server
  end

  after do

  end


  context 'with valid params' do
    it 'will save' do
      tag[:name].should be_type_of(String)
      tag[:id].should be_type_of(Integer)
      tag[:created_at].should be_type_of(Date)
    end
  end
  
  context 'with invalid params' do
    
  end

end


