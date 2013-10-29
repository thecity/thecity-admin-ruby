module TheCityAdmin
  FactoryGirl.define do
  
    factory :address, :class => TheCity::Address do
      city "Sammamish" 
      created_at "04/30/2012 11:54 PM (UTC)" 
      latitude 47.60918 
      updated_at "05/01/2012 12:00 AM (UTC)" 
      zipcode nil 
      id 1027473241 
      street "12345 Main" 
      location_type "Host" 
      privacy "Private" 
      longitude -122.059499 
      state nil
    end

  end
end


