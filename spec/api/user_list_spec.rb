require File.join(Dir.pwd, 'spec', 'spec_helper')

describe 'UserList' do

  before do
    simulate_connection_to_server
  end

  after do

  end


  it 'should not fail if user list is not specifed' do
    request_data = FactoryGirl.attributes_for(:user_list).to_json
    TheCity.stub(:admin_request).and_return(request_data)
    reader = TheCity::UserListReader.new
    user_list = TheCity::UserList.new(reader)

    user_list.names.should == []
  end


  it 'should not fail if user list is empty' do
    request_data = FactoryGirl.attributes_for(:user_list, :users => []).to_json
    TheCity.stub(:admin_request).and_return(request_data)
    reader = TheCity::UserListReader.new
    user_list = TheCity::UserList.new(reader)

    user_list.names.should == []
  end


  it 'should return a valid list of users' do
    request_data = FactoryGirl.attributes_for(:user_list, {:users => [FactoryGirl.attributes_for(:user)]}).to_json
    TheCity.stub(:admin_request).and_return(request_data)
    reader = TheCity::UserListReader.new
    user_list = TheCity::UserList.new(reader)

    user_list.names.should == ['James Hays']
  end

  it 'should iterate using *each* method' do
    request_data = FactoryGirl.attributes_for(:user_list, {:users => [FactoryGirl.attributes_for(:user)]}).to_json
    TheCity.stub(:admin_request).and_return(request_data)
    reader = TheCity::UserListReader.new
    user_list = TheCity::UserList.new(reader)

    users = []
    user_list.each { |user| users << user.full_name }
    users.should == ['James Hays']
  end  


  it 'should iterate using *collect* method' do
    request_data = FactoryGirl.attributes_for(:user_list, {:users => [FactoryGirl.attributes_for(:user)]}).to_json
    TheCity.stub(:admin_request).and_return(request_data)
    reader = TheCity::UserListReader.new
    user_list = TheCity::UserList.new(reader)

    users = user_list.collect { |user| user.full_name }
    users.should == ['James Hays']
  end    


end


