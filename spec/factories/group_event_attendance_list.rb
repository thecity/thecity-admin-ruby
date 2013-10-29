module TheCityAdmin
  FactoryGirl.define do
  
    factory :group_event_attendance_list, :class => TheCity::GroupEventAttendanceList do
      total_entries 0
      total_pages 0
      per_page 15
      current_page 1
      #event_attendances {}
    end

  end
end