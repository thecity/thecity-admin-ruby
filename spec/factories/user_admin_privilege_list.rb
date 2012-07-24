module TheCity
  FactoryGirl.define do
  
    factory :user_admin_privilege_list, :class => TheCity::UserAdminPrivilegeList do
      total_entries 0
      total_pages 0
      per_page 15
      current_page 1
      #acct_roles {}
    end

  end
end