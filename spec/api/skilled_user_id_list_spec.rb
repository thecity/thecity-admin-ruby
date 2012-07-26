require File.join(Dir.pwd, 'spec', 'spec_helper')

describe 'SkilledUserIdList' do

  before do
    simulate_connection_to_server
  end

  after do

  end


  it 'should pass if skilled user list attribute is not specifed' do
    skill_id = 123
    request_data = FactoryGirl.attributes_for(:skilled_user_id_list).to_json
    TheCity.stub(:admin_request).and_return(request_data)
    skilled_user_id_list = TheCity::SkilledUserIdList.new({:skill_id => skill_id})

    skilled_user_id_list.user_ids.should == []    
  end


  it 'should pass if skilled user list is empty' do
    skill_id = 123
    request_data = FactoryGirl.attributes_for(:skilled_user_id_list, :users => []).to_json
    TheCity.stub(:admin_request).and_return(request_data)
    skilled_user_id_list = TheCity::SkilledUserIdList.new({:skill_id => skill_id})

    skilled_user_id_list.user_ids.should == []
  end


  it 'should return a valid list of users' do
    skill_id = 123
    page = 2
    request_data = FactoryGirl.attributes_for(:skilled_user_id_list, {
      :total_entries => 1,
      :total_pages => 1,
      :user_ids => [FactoryGirl.attributes_for(:user)[:id]]
    }).to_json
    TheCity.stub(:admin_request).and_return(request_data)
    skilled_user_id_list = TheCity::SkilledUserIdList.new({:skill_id => skill_id, :page => page})

    skilled_user_id_list.user_ids.should == [946060874]
  end


  it 'should iterate using *each* method' do
    skill_id = 123
    request_data = FactoryGirl.attributes_for(:skilled_user_id_list, {
      :total_entries => 1,
      :total_pages => 1,
      :user_ids => [FactoryGirl.attributes_for(:user)[:id]]
    }).to_json
    TheCity.stub(:admin_request).and_return(request_data)
    skilled_user_id_list = TheCity::SkilledUserIdList.new({:skill_id => skill_id})

    users = []
    skilled_user_id_list.each { |user_id| users << user_id}
    skilled_user_id_list.user_ids.should == [946060874]
  end  


  it 'should iterate using *collect* method' do
    skill_id = 123
    request_data = FactoryGirl.attributes_for(:skilled_user_id_list, {
      :total_entries => 1,
      :total_pages => 1,
      :user_ids => [FactoryGirl.attributes_for(:user)[:id]]
    }).to_json
    TheCity.stub(:admin_request).and_return(request_data)
    skilled_user_id_list = TheCity::SkilledUserIdList.new({:skill_id => skill_id})

    users = skilled_user_id_list.collect { |user_id| user_id }
    skilled_user_id_list.user_ids.should == [946060874]
  end    


end


