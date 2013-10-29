module TheCityAdmin
  FactoryGirl.define do
  
    factory :user_skill_list, :class => TheCity::UserSkillList do
      total_entries 0
      total_pages 0
      per_page 15
      current_page 1
      #skills {}
    end

  end
end