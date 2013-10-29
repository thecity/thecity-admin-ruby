require File.dirname(__FILE__) + '/../spec_helper'

describe TheCityAdmin::ApiReader do

  it "should include City headers" do
    headers = "X-City-RateLimit-Limit-By-Ip: 2200\r\nX-City-RateLimit-Remaining-By-Ip: 2199\r\n"
    TheCity.stub(:admin_request).and_return(TheCityResponse.new(200, {}.to_json, headers))
    reader = TheCityAdmin::ApiReader.new
    reader.load_feed.should == {}
    reader.headers['X-City-RateLimit-Limit-By-Ip'].should == '2200'
    reader.headers['X-City-RateLimit-Remaining-By-Ip'].should == '2199'
  end

  it "should include convenience methods for reading rate limit data" do
    headers = ["X-City-RateLimit-Limit-By-Ip: 2000",
               "X-City-RateLimit-Remaining-By-Ip: 1987",
               "X-City-RateLimit-Limit-By-Account: 3000",
               "X-City-RateLimit-Remaining-By-Account: 1561"].join("\r\n")
    TheCity.stub(:admin_request).and_return(TheCityResponse.new(200, {}.to_json, headers))
    reader = TheCityAdmin::ApiReader.new
    reader.load_feed.should == {}
    reader.rate_limit.should == 2000
    reader.rate_limit_remaining.should == 1561
  end

end