require File.join(Dir.pwd, 'spec', 'spec_helper')

describe 'TagGroupList' do

  before do
    simulate_connection_to_server
  end

  after do

  end


  it 'should pass if tag group list is empty' do
    tag_id = 123
    request_data = FactoryGirl.attributes_for(:tag_group_list, :groups => []).to_json
    TheCity.stub(:admin_request).and_return( TheCityResponse.new(200, request_data) )
    tag_group_list = TheCity::TagGroupList.new({:tag_id => tag_id})

    tag_group_list.groups.should == []
  end


  it 'should return a valid list of groups' do
    tag_id = 123
    page = 2
    request_data = FactoryGirl.attributes_for(:tag_group_list, {
      :total_entries => 1,
      :total_pages => 1,
      :groups => [FactoryGirl.attributes_for(:group)]
    }).to_json
    TheCity.stub(:admin_request).and_return( TheCityResponse.new(200, request_data) )
    tag_group_list = TheCity::TagGroupList.new({:tag_id => tag_id, :page => page})

    tag_group_list.groups.should == ["The Group"]
  end


  it 'should iterate using *each* method' do
    tag_id = 123
    request_data = FactoryGirl.attributes_for(:tag_group_list, {
      :total_entries => 1,
      :total_pages => 1,
      :groups => [FactoryGirl.attributes_for(:group)]
    }).to_json
    TheCity.stub(:admin_request).and_return( TheCityResponse.new(200, request_data) )
    tag_group_list = TheCity::TagGroupList.new({:tag_id => tag_id})

    groups = []
    tag_group_list.each { |group| groups << group.name }
    tag_group_list.groups.should == ["The Group"]
  end  


  it 'should iterate using *collect* method' do
    tag_id = 123
    request_data = FactoryGirl.attributes_for(:tag_group_list, {
      :total_entries => 1,
      :total_pages => 1,
      :groups => [FactoryGirl.attributes_for(:group)]
    }).to_json
    TheCity.stub(:admin_request).and_return( TheCityResponse.new(200, request_data) )
    tag_group_list = TheCity::TagGroupList.new({:tag_id => tag_id})

    groups = tag_group_list.collect { |group| group.name }
    tag_group_list.groups.should == ["The Group"]
  end    


end


