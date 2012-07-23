require File.join(Dir.pwd, 'spec', 'spec_helper')

describe 'UserAddressList' do

  before do
    simulate_connection_to_server
  end

  after do

  end


  it 'should not fail if user address list attribute is not specifed' do
    request_data = FactoryGirl.attributes_for(:user_address_list, {
      :total_entries => 1,
      :total_pages => 1,
      :addresses => [FactoryGirl.attributes_for(:user_address)]
    }).to_json
    TheCity.stub(:admin_request).and_return(request_data)

    reader = TheCity::UserAddressListReader.new
    address_list = TheCity::UserAddressList.new(reader)

    address = address_list[0]
    address.city.should == "Seattle"
  end


  it 'should not fail if user address list is empty' do

  end

  it 'should return a valid list of user addresses'
  it 'should iterate using *each* method'
  it 'should iterate using *collect* method'


end


