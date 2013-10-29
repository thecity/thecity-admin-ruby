require File.join(Dir.pwd, 'spec', 'spec_helper')

describe 'GroupEventAttendanceList' do

  before do
    simulate_connection_to_server
  end

  after do

  end


  it 'should pass if group event attendance list attribute is not specifed' do
    group_id = 123
    request_data = FactoryGirl.attributes_for(:group_event_attendance_list, {
      :total_entries => 1,
      :total_pages => 1,
      :event_attendances => [FactoryGirl.attributes_for(:group_event_attendance)]
    }).to_json
    TheCityAdmin.stub(:admin_request).and_return( TheCityResponse.new(200, request_data) )
    attendance_list = TheCityAdmin::GroupEventAttendanceList.new({:group_id => group_id})

    attendance = attendance_list[0]
    attendance.user.should == "Johnny Smith"
  end


  it 'should pass if group checkin list is empty' do
    group_id = 123
    page = 2
    request_data = FactoryGirl.attributes_for(:group_event_attendance_list, {
      :total_entries => 1,
      :total_pages => 1,
      :event_attendances => []
    }).to_json
    TheCityAdmin.stub(:admin_request).and_return( TheCityResponse.new(200, request_data) )
    attendance_list = TheCityAdmin::GroupEventAttendanceList.new({:group_id => group_id})

    attendance_list.empty?.should be_true
  end


  it 'should return a valid list of group event attendances' do 
    group_id = 123
    page = 2
    request_data = FactoryGirl.attributes_for(:group_event_attendance_list, {
      :total_entries => 1,
      :total_pages => 1,
      :event_attendances => [FactoryGirl.attributes_for(:group_event_attendance)]
    }).to_json
    TheCityAdmin.stub(:admin_request).and_return( TheCityResponse.new(200, request_data) )
    attendance_list = TheCityAdmin::GroupEventAttendanceList.new({:group_id => group_id, :page => 2})

    attendance = attendance_list[0]
    attendance.user.should == "Johnny Smith"
  end


  it 'should iterate using *each* method' do
    group_id = 123
    request_data = FactoryGirl.attributes_for(:group_event_attendance_list, {
      :total_entries => 1,
      :total_pages => 1,
      :event_attendances => [FactoryGirl.attributes_for(:group_event_attendance)]
    }).to_json
    TheCityAdmin.stub(:admin_request).and_return( TheCityResponse.new(200, request_data) )
    attendance_list = TheCityAdmin::GroupEventAttendanceList.new({:group_id => group_id})

    attendances = []
    attendance_list.each { |attendance| attendances << attendance.user }
    attendances.should == ["Johnny Smith"]
  end  


  it 'should iterate using *collect* method' do
    group_id = 123
    request_data = FactoryGirl.attributes_for(:group_event_attendance_list, {
      :total_entries => 1,
      :total_pages => 1,
      :event_attendances => [FactoryGirl.attributes_for(:group_event_attendance)]
    }).to_json
    TheCityAdmin.stub(:admin_request).and_return( TheCityResponse.new(200, request_data) )
    attendance_list = TheCityAdmin::GroupEventAttendanceList.new({:group_id => group_id})

    attendances = attendance_list.collect { |attendance| attendance.user }
    attendances.should == ["Johnny Smith"]
  end   


end


