require File.dirname(__FILE__) + '/../spec_helper'

describe 'GroupCheckin' do

  let(:request_data) { (FactoryGirl.attributes_for(:group_checkin)).to_json }

  it 'loads by id' do
    TheCity.stub(:admin_request).and_return( TheCityResponse.new(200, request_data) )
    group_checkin = TheCity::GroupCheckin.load_by_id(12345, 12345)
    group_checkin.should_not be_nil
  end

  it 'loads by pager_number' do
    TheCity.stub(:admin_request).and_return( TheCityResponse.new(200, request_data) )
    group_checkin = TheCity::GroupCheckin.load_by_pager_number(12345, 12345)
    group_checkin.should_not be_nil
  end

  it 'loads by callboard_number' do
    TheCity.stub(:admin_request).and_return( TheCityResponse.new(200, request_data) )
    group_checkin = TheCity::GroupCheckin.load_by_callboard_number(12345, 12345)
    group_checkin.should_not be_nil
  end
end