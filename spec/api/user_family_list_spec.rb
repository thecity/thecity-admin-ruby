require File.join(Dir.pwd, 'spec', 'spec_helper')

describe 'UserFamilyList' do

  before do
    simulate_connection_to_server
  end

  after do
    
  end


  it 'should pass if user family list attribute is not specifed' do
    user_id = 123
    request_data = FactoryGirl.attributes_for(:user_family_list, {
      :total_entries => 1,
      :total_pages => 1,
      :family_members => [FactoryGirl.attributes_for(:user_family_member)]
    }).to_json
    TheCity.stub(:admin_request).and_return(request_data)
    family_list = TheCity::UserFamilyList.new({:user_id => user_id})

    family = family_list[0]
    family.name.should == "Pastor Sam Shepherd"
  end


  it 'should pass if user family list is empty' do
    user_id = 123
    request_data = FactoryGirl.attributes_for(:user_family_list, {
      :total_entries => 1,
      :total_pages => 1,
      :family_members => []
    }).to_json
    TheCity.stub(:admin_request).and_return(request_data)
    family_list = TheCity::UserFamilyList.new({:user_id => user_id})

    family_list.empty?.should be_true
  end


  it 'should return a valid list of user family_members' do 
    user_id = 123
    page = 2
    request_data = FactoryGirl.attributes_for(:user_family_list, {
      :total_entries => 1,
      :total_pages => 1,
      :family_members => [FactoryGirl.attributes_for(:user_family_member)]
    }).to_json
    TheCity.stub(:admin_request).and_return(request_data)
    family_list = TheCity::UserFamilyList.new({:user_id => user_id, :page => page})

    family = family_list[0]
    family.name.should == "Pastor Sam Shepherd"
  end


  it 'should iterate using *each* method' do
    user_id = 123
    request_data = FactoryGirl.attributes_for(:user_family_list, {
      :total_entries => 1,
      :total_pages => 1,
      :family_members => [FactoryGirl.attributes_for(:user_family_member)]
    }).to_json
    TheCity.stub(:admin_request).and_return(request_data)
    family_list = TheCity::UserFamilyList.new({:user_id => user_id})

    family_members = []
    family_list.each { |family| family_members << family.name }
    family_members.should == ["Pastor Sam Shepherd"]
  end  


  it 'should iterate using *collect* method' do
    user_id = 123
    request_data = FactoryGirl.attributes_for(:user_family_list, {
      :total_entries => 1,
      :total_pages => 1,
      :family_members => [FactoryGirl.attributes_for(:user_family_member)]
    }).to_json
    TheCity.stub(:admin_request).and_return(request_data)
    family_list = TheCity::UserFamilyList.new({:user_id => user_id})

    family_members = family_list.collect { |family| family.name }
    family_members.should == ["Pastor Sam Shepherd"]
  end   

end


