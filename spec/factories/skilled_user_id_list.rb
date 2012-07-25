module TheCity
  FactoryGirl.define do
  
    factory :skilled_user_id_list, :class => TheCity::SkilledUserIdList do
      total_entries 0
      total_pages 0
      per_page 15
      current_page 1
      #user_ids {}
    end

  end
end