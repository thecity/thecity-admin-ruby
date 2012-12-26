require File.dirname(__FILE__) + '/../spec_helper'

def do_test(opts={})
  rate_headers = TheCity::RateHeader.new(0, opts[:remaining_calls], 0, opts[:remaining_calls])
  TheCity.stub(:admin_request).and_return(TheCityResponse.new(200, {}.to_json, rate_headers.header_raw))

  reader = TheCity::ApiReader.new
  reader.extend Pacemaker

  Timecop.freeze(2012, 12, 05, 12, opts[:now_min], opts[:now_sec]) do
    reader.load_feed.should == {}
    reader.sleep_pace.should == opts[:expected_pace]
  end
end

describe Pacemaker do
  it 'should not sleep if sleep time is less than 1 second' do
    do_test(:now_min => 1, :now_sec => 0, :remaining_calls => 9000, :expected_pace => 0)
  end

  # perhaps should be configurable. or should support knowing an estimated number of calls
  # remaining. if there are 50 calls left and 59 minutes left in the hour, but i only need
  # to make 4 calls, no reason to sleep at all. the worst case scenarios here force sleeping
  # when it's not really desired.
  it 'should not sleep if remaining calls is more than 10' do
    do_test(:now_min => 1, :now_sec => 0, :remaining_calls => 11, :expected_pace => 0)
  end

  # the buffer is required so you don't make the first new call of the hour anticipating it to work
  # when the client and server clocks are not in sync and then it fails to work
  it 'should sleep for the rest of the hour (plus 10 second buffer) if no more calls are left' do
    do_test(:now_min => 1, :now_sec => 0, :remaining_calls => 0, :expected_pace => (59*60)+10)
  end

  it 'should sleep for one second (plus buffer) with 2 seconds to go and 1 call left' do
    do_test(:now_min => 59, :now_sec => 58, :remaining_calls => 1, :expected_pace => 1 + 10)
  end

  it 'should sleep for 30 seconds with 1 minute to go and 1 call left' do
    do_test(:now_min => 59, :now_sec => 0, :remaining_calls => 1, :expected_pace => 30 + 10)
  end

  it 'should sleep for 15 seconds with 1 minute to go and 3 calls left' do
    do_test(:now_min => 59, :now_sec => 0, :remaining_calls => 3, :expected_pace => 15 + 10)
  end
end
