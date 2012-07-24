require File.join(Dir.pwd, 'spec', 'spec_helper')

describe 'UserRoleList' do

  before do
    simulate_connection_to_server
  end

  after do

  end


  it 'should pass if user role list attribute is not specifed' do
    user_id = 123
    request_data = FactoryGirl.attributes_for(:user_role_list, {
      :total_entries => 1,
      :total_pages => 1,
      :roles => [FactoryGirl.attributes_for(:user_role)]
    }).to_json
    TheCity.stub(:admin_request).and_return(request_data)

    reader = TheCity::UserRoleListReader.new(user_id)
    role_list = TheCity::UserRoleList.new(reader)

    role = role_list[0]
    role.group_name.should == "The Group"
  end


  it 'should pass if user role list is empty' do
    user_id = 123
    page = 2
    request_data = FactoryGirl.attributes_for(:user_role_list, {
      :total_entries => 1,
      :total_pages => 1,
      :roles => []
    }).to_json
    TheCity.stub(:admin_request).and_return(request_data)
    reader = TheCity::UserRoleListReader.new(user_id, page)
    role_list = TheCity::UserRoleList.new(reader)

    role_list.empty?.should be_true
  end


  it 'should return a valid list of user roles' do 
    user_id = 123
    page = 2
    request_data = FactoryGirl.attributes_for(:user_role_list, {
      :total_entries => 1,
      :total_pages => 1,
      :roles => [FactoryGirl.attributes_for(:user_role)]
    }).to_json
    TheCity.stub(:admin_request).and_return(request_data)

    reader = TheCity::UserRoleListReader.new(user_id, page)
    role_list = TheCity::UserRoleList.new(reader)

    role = role_list[0]
    role.group_name.should == "The Group"
  end


  it 'should iterate using *each* method' do
    user_id = 123
    request_data = FactoryGirl.attributes_for(:user_role_list, {
      :total_entries => 1,
      :total_pages => 1,
      :roles => [FactoryGirl.attributes_for(:user_role)]
    }).to_json
    TheCity.stub(:admin_request).and_return(request_data)

    reader = TheCity::UserRoleListReader.new(user_id)
    role_list = TheCity::UserRoleList.new(reader)

    roles = []
    role_list.each { |role| roles << role.group_name }
    roles.should == ["The Group"]
  end  


  it 'should iterate using *collect* method' do
    user_id = 123
    request_data = FactoryGirl.attributes_for(:user_role_list, {
      :total_entries => 1,
      :total_pages => 1,
      :roles => [FactoryGirl.attributes_for(:user_role)]
    }).to_json
    TheCity.stub(:admin_request).and_return(request_data)

    reader = TheCity::UserRoleListReader.new(user_id)
    role_list = TheCity::UserRoleList.new(reader)

    roles = role_list.collect { |role| role.group_name }
    roles.should == ["The Group"]
  end   


end


