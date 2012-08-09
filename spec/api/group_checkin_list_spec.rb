require File.join(Dir.pwd, 'spec', 'spec_helper')

describe 'GroupCheckinList' do

  before do
    simulate_connection_to_server
  end

  after do

  end


  it 'should pass if group checkin list attribute is not specifed' do
    group_id = 123
    request_data = FactoryGirl.attributes_for(:group_checkin_list, {
      :total_entries => 1,
      :total_pages => 1,
      :checkins => [FactoryGirl.attributes_for(:group_checkin)]
    }).to_json
    TheCity.stub(:admin_request).and_return(request_data)
    checkin_list = TheCity::GroupCheckinList.new({:group_id => group_id})

    checkin = checkin_list[0]
    checkin.parent_group_name.should == "Ballard Childrens ministry"
  end


  # it 'should pass if group checkin list is empty' do
  #   group_id = 123
  #   page = 2
  #   request_data = FactoryGirl.attributes_for(:group_checkin_list, {
  #     :total_entries => 1,
  #     :total_pages => 1,
  #     :checkins => []
  #   }).to_json
  #   TheCity.stub(:admin_request).and_return(request_data)
  #   checkin_list = TheCity::GroupCheckinList.new({:group_id => group_id})

  #   checkin_list.empty?.should be_true
  # end


  # it 'should return a valid list of group checkins' do 
  #   group_id = 123
  #   page = 2
  #   request_data = FactoryGirl.attributes_for(:group_checkin_list, {
  #     :total_entries => 1,
  #     :total_pages => 1,
  #     :checkins => [FactoryGirl.attributes_for(:group_checkin)]
  #   }).to_json
  #   TheCity.stub(:admin_request).and_return(request_data)
  #   checkin_list = TheCity::GroupCheckinList.new({:group_id => group_id, :page => 2})

  #   checkin = checkin_list[0]
  #   checkin.city.should == "Sammamish"
  # end


  # it 'should iterate using *each* method' do
  #   group_id = 123
  #   request_data = FactoryGirl.attributes_for(:group_checkin_list, {
  #     :total_entries => 1,
  #     :total_pages => 1,
  #     :checkins => [FactoryGirl.attributes_for(:group_checkin)]
  #   }).to_json
  #   TheCity.stub(:admin_request).and_return(request_data)
  #   checkin_list = TheCity::GroupCheckinList.new({:group_id => group_id})

  #   checkins = []
  #   checkin_list.each { |checkin| checkins << checkin.city }
  #   checkins.should == ["Sammamish"]
  # end  


  # it 'should iterate using *collect* method' do
  #   group_id = 123
  #   request_data = FactoryGirl.attributes_for(:group_checkin_list, {
  #     :total_entries => 1,
  #     :total_pages => 1,
  #     :checkins => [FactoryGirl.attributes_for(:group_checkin)]
  #   }).to_json
  #   TheCity.stub(:admin_request).and_return(request_data)
  #   checkin_list = TheCity::GroupCheckinList.new({:group_id => group_id})

  #   checkins = checkin_list.collect { |checkin| checkin.city }
  #   checkins.should == ["Sammamish"]
  # end   


end


