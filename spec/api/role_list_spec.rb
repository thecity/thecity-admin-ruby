require File.join(Dir.pwd, 'spec', 'spec_helper')

describe 'RoleList' do

  before do
    simulate_connection_to_server
  end

  after do

  end


  it 'should pass if role list attribute is not specifed' do
    request_data = FactoryGirl.attributes_for(:role_list).to_json
    TheCity.stub(:admin_request).and_return( TheCityResponse.new(200, request_data) )
    role_list = TheCity::RoleList.new

    role_list.roles.should == []    
  end


  it 'should pass if role list is empty' do
    request_data = FactoryGirl.attributes_for(:role_list, :roles => []).to_json
    TheCity.stub(:admin_request).and_return( TheCityResponse.new(200, request_data) )
    role_list = TheCity::RoleList.new

    role_list.roles.should == []
  end


  it 'should return a valid list of roles' do
    request_data = FactoryGirl.attributes_for(:role_list, {
      :total_entries => 1,
      :total_pages => 1,
      :roles => [FactoryGirl.attributes_for(:role)]
    }).to_json
    TheCity.stub(:admin_request).and_return( TheCityResponse.new(200, request_data) )
    role_list = TheCity::RoleList.new({:page => 2})
    role_list.roles.should == ["Leader"]
  end


  it 'should iterate using *each* method' do
    request_data = FactoryGirl.attributes_for(:role_list, {
      :total_entries => 1,
      :total_pages => 1,
      :roles => [FactoryGirl.attributes_for(:role)]
    }).to_json
    TheCity.stub(:admin_request).and_return( TheCityResponse.new(200, request_data) )
    role_list = TheCity::RoleList.new

    roles = []
    role_list.each { |role| roles << role.title }
    role_list.roles.should == ["Leader"]
  end  


  it 'should iterate using *collect* method' do
    request_data = FactoryGirl.attributes_for(:role_list, {
      :total_entries => 1,
      :total_pages => 1,
      :roles => [FactoryGirl.attributes_for(:role)]
    }).to_json
    TheCity.stub(:admin_request).and_return( TheCityResponse.new(200, request_data) )
    role_list = TheCity::RoleList.new

    roles = role_list.collect { |role| role.title }
    role_list.roles.should == ["Leader"]
  end    


end


