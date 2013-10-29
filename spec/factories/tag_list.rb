module TheCityAdmin
  FactoryGirl.define do
  
    factory :tag_list, :class => TheCityAdmin::TagList do
      total_entries 0
      total_pages 0
      per_page 15
      current_page 1
      #tags {}
    end

  end
end