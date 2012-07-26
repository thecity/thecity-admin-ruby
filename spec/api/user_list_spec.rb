require File.join(Dir.pwd, 'spec', 'spec_helper')

describe 'UserList' do

  before do
    simulate_connection_to_server
  end

  after do

  end


  it 'should pass if user list attribute is not specifed' do
    request_data = FactoryGirl.attributes_for(:user_list).to_json
    TheCity.stub(:admin_request).and_return(request_data)
    user_list = TheCity::UserList.new

    user_list.names.should == []
  end


  it 'should pass if user list is empty' do
    request_data = FactoryGirl.attributes_for(:user_list, :users => []).to_json
    TheCity.stub(:admin_request).and_return(request_data)
    user_list = TheCity::UserList.new

    user_list.names.should == []
  end


  it 'should return a valid list of users' do
    request_data = FactoryGirl.attributes_for(:user_list, {
      :total_entries => 1,
      :total_pages => 1,
      :users => [FactoryGirl.attributes_for(:user)]
    }).to_json
    TheCity.stub(:admin_request).and_return(request_data)
    user_list = TheCity::UserList.new({:page => 2})

    user_list.names.should == ["Sam Shepherd"]
  end


  it 'should iterate using *each* method' do
    request_data = FactoryGirl.attributes_for(:user_list, {
      :total_entries => 1,
      :total_pages => 1,
      :users => [FactoryGirl.attributes_for(:user)]
    }).to_json
    TheCity.stub(:admin_request).and_return(request_data)
    user_list = TheCity::UserList.new

    users = []
    user_list.each { |user| users << user.full_name }
    user_list.names.should == ["Sam Shepherd"]
  end  


  it 'should iterate using *collect* method' do
    request_data = FactoryGirl.attributes_for(:user_list, {
      :total_entries => 1,
      :total_pages => 1,
      :users => [FactoryGirl.attributes_for(:user)]
    }).to_json
    TheCity.stub(:admin_request).and_return(request_data)
    user_list = TheCity::UserList.new

    users = user_list.collect { |user| user.full_name }
    user_list.names.should == ["Sam Shepherd"]
  end    


end


