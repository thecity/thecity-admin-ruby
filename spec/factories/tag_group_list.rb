module TheCity
  FactoryGirl.define do
  
    factory :tag_group_list, :class => TheCity::TagGroupList do
      total_entries 0
      total_pages 0
      per_page 15
      current_page 1
      #groups {}
    end

  end
end