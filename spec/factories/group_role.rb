module TheCityAdmin
  FactoryGirl.define do
  
    factory :group_role, :class => TheCity::GroupRole do
      created_at "04/30/2012" 
      title nil 
      user_api_url "https://api.onthecity.org/users/494335566" 
      id 265005445 
      user_type "Offline User" 
      user_id 494335566 
      last_engaged nil 
      user_name "Joe Offline" 
      active true
    end

  end
end


