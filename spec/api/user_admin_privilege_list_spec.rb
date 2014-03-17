require File.join(Dir.pwd, 'spec', 'spec_helper')

describe 'UserAdminPrivilegeList' do

  before do
    simulate_connection_to_server
  end

  after do
    
  end


  it 'should pass if user admin_privilege list attribute is not specifed' do
    user_id = 123
    request_data = FactoryGirl.attributes_for(:user_admin_privilege_list, {
      :total_entries => 1,
      :total_pages => 1,
      :account_roles => [FactoryGirl.attributes_for(:user_admin_privilege)]
    }).to_json
    TheCityAdmin.stub(:admin_request).and_return( TheCityResponse.new(200, request_data) )
    admin_privilege_list = TheCityAdmin::UserAdminPrivilegeList.new({:user_id => user_id})

    admin_privilege = admin_privilege_list[0]
    admin_privilege.title.should == "Designer"
  end


  it 'should pass if user admin_privilege list is empty' do
    user_id = 123
    request_data = FactoryGirl.attributes_for(:user_admin_privilege_list, {
      :total_entries => 1,
      :total_pages => 1,
      :account_roles => []
    }).to_json
    TheCityAdmin.stub(:admin_request).and_return( TheCityResponse.new(200, request_data) )
    admin_privilege_list = TheCityAdmin::UserAdminPrivilegeList.new({:user_id => user_id})

    admin_privilege_list.empty?.should be_true
  end


  it 'should return a valid list of user admin_privileges' do 
    user_id = 123
    page = 2
    request_data = FactoryGirl.attributes_for(:user_admin_privilege_list, {
      :total_entries => 1,
      :total_pages => 1,
      :account_roles => [FactoryGirl.attributes_for(:user_admin_privilege)]
    }).to_json
    TheCityAdmin.stub(:admin_request).and_return( TheCityResponse.new(200, request_data) )
    admin_privilege_list = TheCityAdmin::UserAdminPrivilegeList.new({:user_id => user_id, :page => page})

    admin_privilege = admin_privilege_list[0]
    admin_privilege.title.should == "Designer"
  end


  it 'should iterate using *each* method' do
    user_id = 123
    request_data = FactoryGirl.attributes_for(:user_admin_privilege_list, {
      :total_entries => 1,
      :total_pages => 1,
      :account_roles => [FactoryGirl.attributes_for(:user_admin_privilege)]
    }).to_json
    TheCityAdmin.stub(:admin_request).and_return( TheCityResponse.new(200, request_data) )
    admin_privilege_list = TheCityAdmin::UserAdminPrivilegeList.new({:user_id => user_id})

    admin_privileges = []
    admin_privilege_list.each { |admin_privilege| admin_privileges << admin_privilege.title }
    admin_privileges.should == ["Designer"]
  end  


  it 'should iterate using *collect* method' do
    user_id = 123
    request_data = FactoryGirl.attributes_for(:user_admin_privilege_list, {
      :total_entries => 1,
      :total_pages => 1,
      :account_roles => [FactoryGirl.attributes_for(:user_admin_privilege)]
    }).to_json
    TheCityAdmin.stub(:admin_request).and_return( TheCityResponse.new(200, request_data) )
    admin_privilege_list = TheCityAdmin::UserAdminPrivilegeList.new({:user_id => user_id})

    admin_privileges = admin_privilege_list.collect { |admin_privilege| admin_privilege.title }
    admin_privileges.should == ["Designer"]
  end   

end





