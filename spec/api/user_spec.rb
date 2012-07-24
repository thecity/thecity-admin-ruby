require File.join(Dir.pwd, 'spec', 'spec_helper')

describe 'User' do

  before do
    simulate_connection_to_server
  end

  after do

  end

  it 'should pass retrieving a user from list' do
    request_data = FactoryGirl.attributes_for(:user_list, {
      :total_entries => 1,
      :total_pages => 1,
      :users => [FactoryGirl.attributes_for(:user)]
    }).to_json
    TheCity.stub(:admin_request).and_return(request_data)

    reader = TheCity::UserListReader.new
    user_list = TheCity::UserList.new(reader)

    user = user_list[0]
    user.full_name.should == "Sammy Shepherd"
  end


  it 'should pass retrieving a user' do
    TheCity.stub(:admin_request).and_return(FactoryGirl.attributes_for(:user).to_json)
    user = TheCity::User.load_user_by_id(123)
    user.full_name.should == "Sammy Shepherd"
  end  

end


