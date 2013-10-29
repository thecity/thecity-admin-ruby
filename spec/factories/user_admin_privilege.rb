module TheCityAdmin
  FactoryGirl.define do
  
    factory :user_admin_privilege, :class => TheCity::UserAdminPrivilege do
      title "Designer"
      user_id 452617
      user "Dr. Third Eagle"
    end

  end
end