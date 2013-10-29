module TheCityAdmin
  FactoryGirl.define do
    
    factory :group, :class => TheCityAdmin::Group do
      name "The Group"
      admin_url "http://church.onthecity.org/admin/groups/1445"
      created_at "2009-03-16T03:39:05-07:00"
      started_as_seed false
      offline_user_ids [ 94769, 48583 ]
      campus_name "The Campus"
      nearest_neighborhood_id nil
      nickname ""
      group_type "Service"
      internal_url "http://church.onthecity.org/groups/1445"
      id 1445
      nearest_neighborhood_name nil
      plaza_url "http://church.onthecity.org/plaza?group_id=1445"
      smart_large_profile_pic "http://church.onthecity.org/image_service/10/1445/false/group_large_profile"
      campus_id 1245
      parent_id 1245
      external_description ""
      api_url "https://api.onthecity.org/groups/1445"
    end

  end
end




