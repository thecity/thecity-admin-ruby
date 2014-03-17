require 'spec_helper'

describe 'TagWriter' do

  it 'should show connection error messages if server cannot be reached' do
    TheCityAdmin.stub(:admin_request) { raise TheCityExceptions::UnableToConnectToTheCity.new('Unable to connect to server') }
    tag_data = {:name => 'Cool People'}
    tag = TheCityAdmin::Tag.new(tag_data)
    tag.id.should be_nil
    tag.save.should === false
    tag.id.should be_nil
    tag.error_messages.should == ['Unable to connect to server']
  end  


  it 'should save if all data is valid for new tag' do
    request_data = FactoryGirl.attributes_for(:tag, {:id => 12345}).to_json
    TheCityAdmin.stub(:admin_request).and_return( TheCityResponse.new(200, request_data) )
    tag_data = {:name => 'Cool People'}
    tag = TheCityAdmin::Tag.new(tag_data)
    tag.id.should be_nil
    tag.save.should === true
    tag.id.should == 12345
  end


  it 'should show error messages if save fails for new tag' do
    TheCityAdmin.stub(:admin_request) { raise TheCityExceptions::TheCityResponseError.new('tag already exists') }
    tag_data = {:name => 'Cool People'}
    tag = TheCityAdmin::Tag.new(tag_data)
    tag.id.should be_nil
    tag.save.should === false
    tag.id.should be_nil
    tag.error_messages.should == ['tag already exists']
  end  


  it 'should save if all data is valid for existing tag' do
    request_data = FactoryGirl.attributes_for(:tag, {:id => 12345}).to_json
    TheCityAdmin.stub(:admin_request).and_return( TheCityResponse.new(200, request_data) )
    tag_data = FactoryGirl.attributes_for(:tag, {:id => 12345})
    tag = TheCityAdmin::Tag.new(tag_data)
    tag.id.should == 12345
    tag.save.should === true
    tag.id.should == 12345
  end


  it 'should show error messages if save fails for existing tag' do
    TheCityAdmin.stub(:admin_request) { raise TheCityExceptions::TheCityResponseError.new('something bad happened') }
    tag_data = FactoryGirl.attributes_for(:tag, {:id => 12345})
    tag = TheCityAdmin::Tag.new(tag_data)
    tag.id.should == 12345
    tag.save.should === false
    tag.id.should == 12345
    tag.error_messages.should == ['something bad happened']
  end  


  it 'should delete if data ID exists for the existing tag' do
    TheCityAdmin.stub(:admin_request).and_return( TheCityResponse.new(204, '{}') )
    tag_data = FactoryGirl.attributes_for(:tag, {:id => 12345})
    tag = TheCityAdmin::Tag.new(tag_data)
    tag.is_deleted?.should === false
    tag.delete
    tag.is_deleted?.should === true
  end


  it 'should show error messages if data fails to be deleted' do
    TheCityAdmin.stub(:admin_request) { raise TheCityExceptions::TheCityResponseError.new('something bad happened') }
    tag_data = FactoryGirl.attributes_for(:tag, {:id => 12345})
    tag = TheCityAdmin::Tag.new(tag_data)
    tag.is_deleted?.should === false
    tag.delete
    tag.is_deleted?.should === false
    tag.error_messages.should == ['something bad happened']
  end  

end
