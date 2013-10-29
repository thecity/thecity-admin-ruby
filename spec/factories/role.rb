module TheCityAdmin
  FactoryGirl.define do
    
    factory :role, :class => TheCity::Role do
      group_name "Small Group" 
      created_at "06/15/2009" 
      group_api_url "https://api.onthecity.org/groups/1933" 
      title "Leader" 
      group_type "CG" 
      user_api_url "https://api.onthecity.org/users/14158" 
      id 80245 
      user_type "User" 
      group_id 1933 
      user_id 14158 
      last_engaged "03/12/2010" 
      user_name "Joe Johnson" 
      active true 
    end

  end
end

