module TheCityAdmin
  FactoryGirl.define do
  
    factory :group_event_attendance, :class => TheCity::GroupEventAttendance do
      user "Johnny Smith" 
      created_at "07/29/2012" 
      event_title "9 AM Service" 
      event_id 84326420 
      updated_at "08/01/2012" 
      tracked_by "Pastor Sam Shepherd" 
      id 980190964 
      user_id 1023606148 
      attended_on "07/29/2012 04:00 PM (UTC)" 
      tracked_by_user_id 946060874
      checkin_id 235323
    end

  end
end
