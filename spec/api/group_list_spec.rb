require File.dirname(__FILE__) + '/../spec_helper'

describe 'GroupList' do

  before do
    #simulate_connection_to_server
  end

  after do

  end


  it 'should pass if group group list attribute is not specified' do
    request_data = FactoryGirl.attributes_for(:group_list, {
        :total_entries => 1,
        :total_pages => 1,
        :groups => [FactoryGirl.attributes_for(:group)]
    }).to_json
    TheCity.stub(:admin_request).and_return( TheCityResponse.new(200, request_data) )
    group_list = TheCity::GroupList.new()

    group = group_list[0]
    group.name.should == "The Group"
  end


  it 'should pass if group group list is empty' do
    request_data = FactoryGirl.attributes_for(:group_list, {
        :total_entries => 1,
        :total_pages => 1,
        :groups => []
    }).to_json
    TheCity.stub(:admin_request).and_return( TheCityResponse.new(200, request_data) )
    group_list = TheCity::GroupList.new()

    group_list.empty?.should be_true
  end


  it 'should return a valid list of group groups' do
    request_data = FactoryGirl.attributes_for(:group_list, {
        :total_entries => 1,
        :total_pages => 1,
        :groups => [FactoryGirl.attributes_for(:group)]
    }).to_json
    TheCity.stub(:admin_request).and_return( TheCityResponse.new(200, request_data) )
    group_list = TheCity::GroupList.new({:page => 2})

    group = group_list[0]
    group.name.should == "The Group"
  end

  it 'should iterate using *each* method' do
    request_data = FactoryGirl.attributes_for(:group_list, {
        :total_entries => 1,
        :total_pages => 1,
        :groups => [FactoryGirl.attributes_for(:group)]
    }).to_json
    TheCity.stub(:admin_request).and_return( TheCityResponse.new(200, request_data) )
    group_list = TheCity::GroupList.new()

    groups = []
    group_list.each { |group| groups << group.name }
    groups.should == ["The Group"]
  end


  it 'should iterate using *collect* method' do
    request_data = FactoryGirl.attributes_for(:group_list, {
        :total_entries => 1,
        :total_pages => 1,
        :groups => [FactoryGirl.attributes_for(:group)]
    }).to_json
    TheCity.stub(:admin_request).and_return( TheCityResponse.new(200, request_data) )
    group_list = TheCity::GroupList.new()

    groups = group_list.collect { |group| group.name }
    groups.should == ["The Group"]
  end


end





