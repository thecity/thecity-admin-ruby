module TheCityAdmin
  FactoryGirl.define do
  
    factory :skilled_user_list, :class => TheCityAdmin::SkilledUserList do
      total_entries 0
      total_pages 0
      per_page 15
      current_page 1
      #users {}
    end

  end
end