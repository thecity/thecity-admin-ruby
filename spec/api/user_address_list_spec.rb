require File.join(Dir.pwd, 'spec', 'spec_helper')

describe 'UserAddressList' do

  before do
    simulate_connection_to_server
  end

  after do

  end


  it 'should pass if user address list attribute is not specifed' do
    user_id = 123
    request_data = FactoryGirl.attributes_for(:user_address_list, {
      :total_entries => 1,
      :total_pages => 1,
      :addresses => [FactoryGirl.attributes_for(:user_address)]
    }).to_json
    TheCity.stub(:admin_request).and_return( TheCityResponse.new(200, request_data) )
    address_list = TheCity::UserAddressList.new({:user_id => user_id})

    address = address_list[0]
    address.city.should == "Seattle"
  end


  it 'should pass if user address list is empty' do
    user_id = 123
    request_data = FactoryGirl.attributes_for(:user_address_list, {
      :total_entries => 1,
      :total_pages => 1,
      :addresses => []
    }).to_json
    TheCity.stub(:admin_request).and_return( TheCityResponse.new(200, request_data) )
    address_list = TheCity::UserAddressList.new({:user_id => user_id})

    address_list.empty?.should be_true
  end


  it 'should return a valid list of user addresses' do 
    user_id = 123
    page = 2
    request_data = FactoryGirl.attributes_for(:user_address_list, {
      :total_entries => 1,
      :total_pages => 1,
      :addresses => [FactoryGirl.attributes_for(:user_address)]
    }).to_json
    TheCity.stub(:admin_request).and_return( TheCityResponse.new(200, request_data) )
    address_list = TheCity::UserAddressList.new({:user_id => user_id, :page => page})

    address = address_list[0]
    address.city.should == "Seattle"
  end


  it 'should iterate using *each* method' do
    user_id = 123
    request_data = FactoryGirl.attributes_for(:user_address_list, {
      :total_entries => 1,
      :total_pages => 1,
      :addresses => [FactoryGirl.attributes_for(:user_address)]
    }).to_json
    TheCity.stub(:admin_request).and_return( TheCityResponse.new(200, request_data) )
    address_list = TheCity::UserAddressList.new({:user_id => user_id})

    addresses = []
    address_list.each { |address| addresses << address.city }
    addresses.should == ["Seattle"]
  end  


  it 'should iterate using *collect* method' do
    user_id = 123
    request_data = FactoryGirl.attributes_for(:user_address_list, {
      :total_entries => 1,
      :total_pages => 1,
      :addresses => [FactoryGirl.attributes_for(:user_address)]
    }).to_json
    TheCity.stub(:admin_request).and_return( TheCityResponse.new(200, request_data) )
    address_list = TheCity::UserAddressList.new({:user_id => user_id})

    addresses = address_list.collect { |address| address.city }
    addresses.should == ["Seattle"]
  end   


end


