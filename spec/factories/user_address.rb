module TheCityAdmin
  FactoryGirl.define do
  
    factory :user_address, :class => TheCity::UserAddress do
      city "Seattle"
      created_at "04/30/2012 08:46 PM (UTC)"
      latitude 47.64114
      updated_at "04/30/2012 09:34 PM (UTC)"
      zipcode "98109"
      id 552561485
      street "2547 32nd Ave W"
      location_type "Home"
      privacy "Private"
      longitude -122.398326
      state "WA"
    end

  end
end