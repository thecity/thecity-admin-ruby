require File.dirname(__FILE__) + '/../spec_helper'

describe 'GroupCheckinEventsList' do

  before do
    #simulate_connection_to_server
  end

  after do

  end


  it 'should pass if group checkin list attribute is not specified' do
    group_id = 123
    request_data = FactoryGirl.attributes_for(:group_checkin_events_list, {
        :total_entries => 1,
        :total_pages => 1,
        :checkin_events => [FactoryGirl.attributes_for(:group_checkin_event)]
    }).to_json
    TheCity.stub(:admin_request).and_return( TheCityResponse.new(200, request_data) )
    checkin_events_list = TheCity::GroupCheckinEventsList.new({:group_id => group_id})
    checkin_event = checkin_events_list[0]
    checkin_event.title.should == "5 PM Service"
  end


  it 'should pass if group checkin list is empty' do
    group_id = 123
    page = 2
    request_data = FactoryGirl.attributes_for(:group_checkin_events_list, {
        :total_entries => 1,
        :total_pages => 1,
        :checkin_events => []
    }).to_json
    TheCity.stub(:admin_request).and_return( TheCityResponse.new(200, request_data) )
    checkin_events_list = TheCity::GroupCheckinEventsList.new({:group_id => group_id})

    checkin_events_list.empty?.should be_true
  end


  it 'should return a valid list of group checkins' do
    group_id = 123
    page = 2
    request_data = FactoryGirl.attributes_for(:group_checkin_events_list, {
        :total_entries => 1,
        :total_pages => 1,
        :checkin_events => [FactoryGirl.attributes_for(:group_checkin_event)]
    }).to_json
    TheCity.stub(:admin_request).and_return( TheCityResponse.new(200, request_data) )
    checkin_events_list = TheCity::GroupCheckinEventsList.new({:group_id => group_id, :page => 2})

    checkin_event = checkin_events_list[0]
    checkin_event.title.should == "5 PM Service"
  end


  it 'should iterate using *each* method' do
    group_id = 123
    request_data = FactoryGirl.attributes_for(:group_checkin_events_list, {
        :total_entries => 1,
        :total_pages => 1,
        :checkin_events => [FactoryGirl.attributes_for(:group_checkin_event)]
    }).to_json
    TheCity.stub(:admin_request).and_return( TheCityResponse.new(200, request_data) )
    checkin_events_list = TheCity::GroupCheckinEventsList.new({:group_id => group_id})

    checkin_events = []
    checkin_events_list.each { |checkin_event| checkin_events << checkin_event.title }
    checkin_events.should == ["5 PM Service"]
  end


  it 'should iterate using *collect* method' do
    group_id = 123
    request_data = FactoryGirl.attributes_for(:group_checkin_events_list, {
        :total_entries => 1,
        :total_pages => 1,
        :checkin_events => [FactoryGirl.attributes_for(:group_checkin_event)]
    }).to_json
    TheCity.stub(:admin_request).and_return( TheCityResponse.new(200, request_data) )
    checkin_events_list = TheCity::GroupCheckinEventsList.new({:group_id => group_id})

    checkin_events = []
    checkin_events_list.collect { |checkin_event| checkin_events << checkin_event.title }
    checkin_events.should == ["5 PM Service"]
  end
end


