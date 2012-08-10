require File.join(Dir.pwd, 'spec', 'spec_helper')

describe 'TagList' do

  before do
    simulate_connection_to_server
  end

  after do

  end


  it 'should pass if tag list attribute is not specifed' do
    request_data = FactoryGirl.attributes_for(:tag_list).to_json
    TheCity.stub(:admin_request).and_return( TheCityResponse.new(200, request_data) )
    tag_list = TheCity::TagList.new

    tag_list.tags.should == []    
  end


  it 'should pass if tag list is empty' do
    request_data = FactoryGirl.attributes_for(:tag_list, :tags => []).to_json
    TheCity.stub(:admin_request).and_return( TheCityResponse.new(200, request_data) )
    tag_list = TheCity::TagList.new

    tag_list.tags.should == []
  end


  it 'should return a valid list of tags' do
    page = 2
    request_data = FactoryGirl.attributes_for(:tag_list, {
      :total_entries => 1,
      :total_pages => 1,
      :tags => [FactoryGirl.attributes_for(:tag)]
    }).to_json
    TheCity.stub(:admin_request).and_return( TheCityResponse.new(200, request_data) )
    tag_list = TheCity::TagList.new({:page => page})

    tag_list.tags.should == ["Evening"]
  end


  it 'should iterate using *each* method' do
    request_data = FactoryGirl.attributes_for(:tag_list, {
      :total_entries => 1,
      :total_pages => 1,
      :tags => [FactoryGirl.attributes_for(:tag)]
    }).to_json
    TheCity.stub(:admin_request).and_return( TheCityResponse.new(200, request_data) )
    tag_list = TheCity::TagList.new

    tags = []
    tag_list.each { |tag| tags << tag.name }
    tag_list.tags.should == ["Evening"]
  end  


  it 'should iterate using *collect* method' do
    request_data = FactoryGirl.attributes_for(:tag_list, {
      :total_entries => 1,
      :total_pages => 1,
      :tags => [FactoryGirl.attributes_for(:tag)]
    }).to_json
    TheCity.stub(:admin_request).and_return( TheCityResponse.new(200, request_data) )
    tag_list = TheCity::TagList.new

    tags = tag_list.collect { |tag| tag.name }
    tag_list.tags.should == ["Evening"]
  end    


end


