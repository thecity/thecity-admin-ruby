require File.join(Dir.pwd, 'spec', 'spec_helper')

describe 'GroupAddressList' do

  before do
    simulate_connection_to_server
  end

  after do

  end


  it 'should pass if group address list attribute is not specifed' do
    group_id = 123
    request_data = FactoryGirl.attributes_for(:group_address_list, {
      :total_entries => 1,
      :total_pages => 1,
      :addresses => [FactoryGirl.attributes_for(:group_address)]
    }).to_json
    TheCityAdmin.stub(:admin_request).and_return( TheCityResponse.new(200, request_data) )
    address_list = TheCityAdmin::GroupAddressList.new({:group_id => group_id})

    address = address_list[0]
    address.city.should == "Sammamish"
  end


  it 'should pass if group address list is empty' do
    group_id = 123
    page = 2
    request_data = FactoryGirl.attributes_for(:group_address_list, {
      :total_entries => 1,
      :total_pages => 1,
      :addresses => []
    }).to_json
    TheCityAdmin.stub(:admin_request).and_return( TheCityResponse.new(200, request_data) )
    address_list = TheCityAdmin::GroupAddressList.new({:group_id => group_id})

    address_list.empty?.should be_true
  end


  it 'should return a valid list of group addresses' do 
    group_id = 123
    page = 2
    request_data = FactoryGirl.attributes_for(:group_address_list, {
      :total_entries => 1,
      :total_pages => 1,
      :addresses => [FactoryGirl.attributes_for(:group_address)]
    }).to_json
    TheCityAdmin.stub(:admin_request).and_return( TheCityResponse.new(200, request_data) )
    address_list = TheCityAdmin::GroupAddressList.new({:group_id => group_id, :page => 2})

    address = address_list[0]
    address.city.should == "Sammamish"
  end


  it 'should iterate using *each* method' do
    group_id = 123
    request_data = FactoryGirl.attributes_for(:group_address_list, {
      :total_entries => 1,
      :total_pages => 1,
      :addresses => [FactoryGirl.attributes_for(:group_address)]
    }).to_json
    TheCityAdmin.stub(:admin_request).and_return( TheCityResponse.new(200, request_data) )
    address_list = TheCityAdmin::GroupAddressList.new({:group_id => group_id})

    addresses = []
    address_list.each { |address| addresses << address.city }
    addresses.should == ["Sammamish"]
  end  


  it 'should iterate using *collect* method' do
    group_id = 123
    request_data = FactoryGirl.attributes_for(:group_address_list, {
      :total_entries => 1,
      :total_pages => 1,
      :addresses => [FactoryGirl.attributes_for(:group_address)]
    }).to_json
    TheCityAdmin.stub(:admin_request).and_return( TheCityResponse.new(200, request_data) )
    address_list = TheCityAdmin::GroupAddressList.new({:group_id => group_id})

    addresses = address_list.collect { |address| address.city }
    addresses.should == ["Sammamish"]
  end   


end


