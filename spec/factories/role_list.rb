module TheCityAdmin
  FactoryGirl.define do
  
    factory :role_list, :class => TheCityAdmin::RoleList do
      total_entries 0
      total_pages 0
      per_page 15
      current_page 1
      #roles {}
    end

  end
end