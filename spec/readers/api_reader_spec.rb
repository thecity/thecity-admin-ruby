require File.dirname(__FILE__) + '/../spec_helper'

describe TheCity::ApiReader do

  it "should include City headers" do
    headers = "X-City-RateLimit-Limit-By-Ip: 2200\r\nX-City-RateLimit-Remaining-By-Ip: 2199\r\n"
    TheCity.stub(:admin_request).and_return( TheCityResponse.new(200, {}.to_json, headers) )
    reader = TheCity::ApiReader.new
    reader.load_feed.should == {}
    reader.headers['X-City-RateLimit-Limit-By-Ip'].should == '2200'
    reader.headers['X-City-RateLimit-Remaining-By-Ip'].should == '2199'
  end

end