require File.join(Dir.pwd, 'spec', 'spec_helper')

describe 'User' do

  before do
    simulate_connection_to_server
  end

  after do

  end

  it 'should not fail retrieving user from list' do
    request_data = FactoryGirl.attributes_for(:user_list, {:users => [FactoryGirl.attributes_for(:user)]}).to_json
    TheCity.stub(:admin_request).and_return(request_data)
    reader = TheCity::UserListReader.new
    user_list = TheCity::UserList.new(reader)

    user_list.names.should == []
  end

end


