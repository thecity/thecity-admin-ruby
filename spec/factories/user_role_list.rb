module TheCityAdmin
  FactoryGirl.define do
  
    factory :user_role_list, :class => TheCityAdmin::UserRoleList do
      total_entries 0
      total_pages 0
      per_page 15
      current_page 1
      #roles {}
    end

  end
end