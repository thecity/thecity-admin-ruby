module TheCityAdmin
  FactoryGirl.define do
    
    factory :user_role, :class => TheCityAdmin::UserRole do
      group_name "The Group" 
      created_at "05/11/2009" 
      group_api_url "https://api.onthecity.org/admin/groups/1245" 
      title "Participant" 
      group_type "Campus" 
      group_id 1245 
      id 75530 
      last_engaged "01/24/2012" 
      active true
    end

  end
end
