module TheCityAdmin
  FactoryGirl.define do
  
    factory :checkin_list, :class => TheCityAdmin::CheckinList do
      total_entries 0
      total_pages 0
      per_page 15
      current_page 1
      #checkins {}
    end

  end
end