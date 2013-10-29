module TheCityAdmin
  FactoryGirl.define do
  
    factory :user_list, :class => TheCityAdmin::UserList do
      total_entries 0
      total_pages 0
      per_page 15
      current_page 1
      #users {}
    end

  end
end