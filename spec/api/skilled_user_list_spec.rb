require File.join(Dir.pwd, 'spec', 'spec_helper')

describe 'SkilledUserList' do

  before do
    simulate_connection_to_server
  end

  after do

  end


  it 'should pass if skilled user list attribute is not specifed' do
    skill_id = 123
    request_data = FactoryGirl.attributes_for(:skilled_user_list).to_json
    TheCity.stub(:admin_request).and_return( TheCityResponse.new(200, request_data) )
    skilled_user_list = TheCityAdmin::SkilledUserList.new({:skill_id => skill_id})

    skilled_user_list.users.should == []    
  end


  it 'should pass if skilled user list is empty' do
    skill_id = 123
    request_data = FactoryGirl.attributes_for(:skilled_user_list, :users => []).to_json
    TheCity.stub(:admin_request).and_return( TheCityResponse.new(200, request_data) )
    skilled_user_list = TheCityAdmin::SkilledUserList.new({:skill_id => skill_id})

    skilled_user_list.users.should == []
  end


  it 'should return a valid list of users' do
    skill_id = 123
    page = 2
    request_data = FactoryGirl.attributes_for(:skilled_user_list, {
      :total_entries => 1,
      :total_pages => 1,
      :users => [FactoryGirl.attributes_for(:user)]
    }).to_json
    TheCity.stub(:admin_request).and_return( TheCityResponse.new(200, request_data) )
    skilled_user_list = TheCityAdmin::SkilledUserList.new({:skill_id => skill_id, :page => page})

    skilled_user_list.users.should == ["Sam Shepherd"]
  end


  it 'should iterate using *each* method' do
    skill_id = 123
    request_data = FactoryGirl.attributes_for(:skilled_user_list, {
      :total_entries => 1,
      :total_pages => 1,
      :users => [FactoryGirl.attributes_for(:user)]
    }).to_json
    TheCity.stub(:admin_request).and_return( TheCityResponse.new(200, request_data) )
    skilled_user_list = TheCityAdmin::SkilledUserList.new({:skill_id => skill_id})

    users = []
    skilled_user_list.each { |user| users << user.full_name }
    skilled_user_list.users.should == ["Sam Shepherd"]
  end  


  it 'should iterate using *collect* method' do
    skill_id = 123
    request_data = FactoryGirl.attributes_for(:skilled_user_list, {
      :total_entries => 1,
      :total_pages => 1,
      :users => [FactoryGirl.attributes_for(:user)]
    }).to_json
    TheCity.stub(:admin_request).and_return( TheCityResponse.new(200, request_data) )
    skilled_user_list = TheCityAdmin::SkilledUserList.new({:skill_id => skill_id})

    users = skilled_user_list.collect { |user| user.full_name }
    skilled_user_list.users.should == ["Sam Shepherd"]
  end    


end


