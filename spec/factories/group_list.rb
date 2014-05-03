module TheCity
  FactoryGirl.define do

    factory :group_list, :class => TheCity::GroupList do
      total_entries 0
      total_pages 0
      per_page 15
      current_page 1
      #roles {}
    end

  end
end