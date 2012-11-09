require File.dirname(__FILE__) + '/../spec_helper'

describe 'GroupCheckinList' do

  before do
    simulate_connection_to_server
  end

  after do

  end


  it 'should pass if group checkin list attribute is not specified' do
    group_id = 123
    request_data = FactoryGirl.attributes_for(:group_checkin_list, {
      :total_entries => 1,
      :total_pages => 1,
      :checkins => [FactoryGirl.attributes_for(:group_checkin)]
    }).to_json
    TheCity.stub(:admin_request).and_return( TheCityResponse.new(200, request_data) )
    checkin_list = TheCity::GroupCheckinList.new({:group_id => group_id})

    checkin = checkin_list[0]
    checkin.parent_group_name.should == "Ballard Childrens ministry"
  end


  it 'should pass if group checkin list is empty' do
    group_id = 123
    page = 2
    request_data = FactoryGirl.attributes_for(:group_checkin_list, {
      :total_entries => 1,
      :total_pages => 1,
      :checkins => []
    }).to_json
    TheCity.stub(:admin_request).and_return( TheCityResponse.new(200, request_data) )
    checkin_list = TheCity::GroupCheckinList.new({:group_id => group_id})

    checkin_list.empty?.should be_true
  end


  it 'should return a valid list of group checkins' do 
    group_id = 123
    page = 2
    request_data = FactoryGirl.attributes_for(:group_checkin_list, {
      :total_entries => 1,
      :total_pages => 1,
      :checkins => [FactoryGirl.attributes_for(:group_checkin)]
    }).to_json
    TheCity.stub(:admin_request).and_return( TheCityResponse.new(200, request_data) )
    checkin_list = TheCity::GroupCheckinList.new({:group_id => group_id, :page => 2})

    checkin = checkin_list[0]
    checkin.parent_group_name.should == "Ballard Childrens ministry"
  end


  it 'should iterate using *each* method' do
    group_id = 123
    request_data = FactoryGirl.attributes_for(:group_checkin_list, {
      :total_entries => 1,
      :total_pages => 1,
      :checkins => [FactoryGirl.attributes_for(:group_checkin)]
    }).to_json
    TheCity.stub(:admin_request).and_return( TheCityResponse.new(200, request_data) )
    checkin_list = TheCity::GroupCheckinList.new({:group_id => group_id})

    checkins = []
    checkin_list.each { |checkin| checkins << checkin.parent_group_name }
    checkins.should == ["Ballard Childrens ministry"]
  end  


  it 'should iterate using *collect* method' do
    group_id = 123
    request_data = FactoryGirl.attributes_for(:group_checkin_list, {
      :total_entries => 1,
      :total_pages => 1,
      :checkins => [FactoryGirl.attributes_for(:group_checkin)]
    }).to_json
    TheCity.stub(:admin_request).and_return( TheCityResponse.new(200, request_data) )
    checkin_list = TheCity::GroupCheckinList.new({:group_id => group_id})

    checkins = checkin_list.collect { |checkin| checkin.parent_group_name }
    checkins.should == ["Ballard Childrens ministry"]
  end   


end


