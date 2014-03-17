require File.join(Dir.pwd, 'spec', 'spec_helper')

describe 'UserProcessList' do

  before do
    simulate_connection_to_server
  end

  after do
  end


  it 'should pass if user process list attribute is not specifed' do
    user_id = 123
    request_data = FactoryGirl.attributes_for(:user_process_list, {
      :total_entries => 1,
      :total_pages => 1,
      :processes => [FactoryGirl.attributes_for(:user_process)]
    }).to_json
    TheCityAdmin.stub(:admin_request).and_return( TheCityResponse.new(200, request_data) )
    process_list = TheCityAdmin::UserProcessList.new({:user_id => user_id})

    process = process_list[0]
    process.name.should == "Member Process"
  end


  it 'should pass if user process list is empty' do
    user_id = 123
    request_data = FactoryGirl.attributes_for(:user_process_list, {
      :total_entries => 1,
      :total_pages => 1,
      :processes => []
    }).to_json
    TheCityAdmin.stub(:admin_request).and_return( TheCityResponse.new(200, request_data) )
    process_list = TheCityAdmin::UserProcessList.new({:user_id => user_id})

    process_list.empty?.should be_true
  end


  it 'should return a valid list of user processes' do 
    user_id = 123
    page = 2
    request_data = FactoryGirl.attributes_for(:user_process_list, {
      :total_entries => 1,
      :total_pages => 1,
      :processes => [FactoryGirl.attributes_for(:user_process)]
    }).to_json
    TheCityAdmin.stub(:admin_request).and_return( TheCityResponse.new(200, request_data) )
    process_list = TheCityAdmin::UserProcessList.new({:user_id => user_id, :page => page})

    process = process_list[0]
    process.name.should == "Member Process"
  end


  it 'should iterate using *each* method' do
    user_id = 123
    request_data = FactoryGirl.attributes_for(:user_process_list, {
      :total_entries => 1,
      :total_pages => 1,
      :processes => [FactoryGirl.attributes_for(:user_process)]
    }).to_json
    TheCityAdmin.stub(:admin_request).and_return( TheCityResponse.new(200, request_data) )
    process_list = TheCityAdmin::UserProcessList.new({:user_id => user_id})

    processes = []
    process_list.each { |process| processes << process.name }
    processes.should == ["Member Process"]
  end  


  it 'should iterate using *collect* method' do
    user_id = 123
    request_data = FactoryGirl.attributes_for(:user_process_list, {
      :total_entries => 1,
      :total_pages => 1,
      :processes => [FactoryGirl.attributes_for(:user_process)]
    }).to_json
    TheCityAdmin.stub(:admin_request).and_return( TheCityResponse.new(200, request_data) )
    process_list = TheCityAdmin::UserProcessList.new({:user_id => user_id})

    processes = process_list.collect { |process| process.name }
    processes.should == ["Member Process"]
  end   

end


