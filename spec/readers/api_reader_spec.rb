require File.dirname(__FILE__) + '/../spec_helper'

describe TheCity::ApiReader do

  it "should include City headers" do
    rate_headers = TheCity::RateHeader.new(2200, 2199)
    TheCity.stub(:admin_request).and_return(TheCityResponse.new(200, {}.to_json, rate_headers.header_raw))
    reader = TheCity::ApiReader.new
    reader.load_feed.should == {}
    reader.headers['X-City-RateLimit-Limit-By-Ip'.downcase].should == '2200'
    reader.headers['X-City-RateLimit-Remaining-By-Ip'.downcase].should == '2199'
  end

  it "should include convenience methods for reading rate limit data" do
    rate_headers = TheCity::RateHeader.new(2000, 1987, 3000, 1561)
    TheCity.stub(:admin_request).and_return(TheCityResponse.new(200, {}.to_json, rate_headers.header_raw))
    reader = TheCity::ApiReader.new
    reader.load_feed.should == {}
    reader.rate_limit.should == 2000
    reader.rate_limit_remaining.should == 1561
  end

end