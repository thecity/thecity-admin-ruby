require File.join(Dir.pwd, 'spec', 'spec_helper')

describe 'WebHookList' do

  before do
    simulate_connection_to_server
  end

  after do

  end


  it 'should pass if web_hook list attribute is not specifed' do
    request_data = FactoryGirl.attributes_for(:web_hook_list).to_json
    TheCityAdmin.stub(:admin_request).and_return( TheCityResponse.new(200, request_data) )
    web_hook_list = TheCityAdmin::WebHookList.new

    web_hook_list.web_hooks.should == []    
  end


  it 'should pass if web_hook list is empty' do
    request_data = FactoryGirl.attributes_for(:web_hook_list, :web_hooks => []).to_json
    TheCityAdmin.stub(:admin_request).and_return( TheCityResponse.new(200, request_data) )
    web_hook_list = TheCityAdmin::WebHookList.new

    web_hook_list.web_hooks.should == []
  end


  it 'should return a valid list of web_hooks' do
    request_data = FactoryGirl.attributes_for(:web_hook_list, {
      :total_entries => 1,
      :total_pages => 1,
      :web_hooks => [FactoryGirl.attributes_for(:web_hook)]
    }).to_json
    TheCityAdmin.stub(:admin_request).and_return( TheCityResponse.new(200, request_data) )
    web_hook_list = TheCityAdmin::WebHookList.new({:page => 2})
    web_hook_list.web_hooks.should == ["User::create"]
  end


  it 'should iterate using *each* method' do
    request_data = FactoryGirl.attributes_for(:web_hook_list, {
      :total_entries => 1,
      :total_pages => 1,
      :web_hooks => [FactoryGirl.attributes_for(:web_hook)]
    }).to_json
    TheCityAdmin.stub(:admin_request).and_return( TheCityResponse.new(200, request_data) )
    web_hook_list = TheCityAdmin::WebHookList.new

    web_hooks = []
    web_hook_list.each { |web_hook| web_hooks << web_hook.name }
    web_hook_list.web_hooks.should == ["User::create"]
  end  


  it 'should iterate using *collect* method' do
    request_data = FactoryGirl.attributes_for(:web_hook_list, {
      :total_entries => 1,
      :total_pages => 1,
      :web_hooks => [FactoryGirl.attributes_for(:web_hook)]
    }).to_json
    TheCityAdmin.stub(:admin_request).and_return( TheCityResponse.new(200, request_data) )
    web_hook_list = TheCityAdmin::WebHookList.new

    web_hooks = web_hook_list.collect { |web_hook| web_hook.name }
    web_hook_list.web_hooks.should == ["User::create"]
  end    


end


