module TheCityAdmin
  FactoryGirl.define do
    
    factory :group_export, :class => TheCityAdmin::GroupExport do
      created_at "02/06/2012 11:36 PM (EST)"
      authenticated_s3_url ""
      id 62706
      state "inqueue"
    end

  end
end




