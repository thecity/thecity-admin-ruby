module TheCity
  FactoryGirl.define do

    factory :group_checkin_events_list, :class => TheCity::GroupCheckinEventsList do
      total_entries 0
      total_pages 0
      per_page 15
      current_page 1
      #checkin_events {}
    end

  end
end