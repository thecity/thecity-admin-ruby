module TheCityAdmin
  FactoryGirl.define do
    
    factory :user_invitation, :class => TheCity::UserInvitation do
      created_at "02/06/2012" 
      pending_approval false
      group_id 17543
      id 1696876
      user_id 14347
      custom_message nil
      source "API Invite | Group A (17543) on 2012-02-06 at 16:54"
      email "theusers@email.net" 
    end

  end
end
