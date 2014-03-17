module TheCityAdmin
  FactoryGirl.define do
  
    factory :user_family_list, :class => TheCityAdmin::UserFamilyList do
      total_entries 0
      total_pages 0
      per_page 15
      current_page 1
      #family_members {}
    end

  end
end