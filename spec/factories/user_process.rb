module TheCityAdmin
  FactoryGirl.define do
    
    factory :user_process, :class => TheCityAdmin::UserProcess do
      name "Member Process"
      id 241832976
      state "complete" 
    end

  end
end
