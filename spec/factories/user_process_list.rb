module TheCity
  FactoryGirl.define do
  
    factory :user_process_list, :class => TheCity::UserProcessList do
      total_entries 0
      total_pages 0
      per_page 15
      current_page 1
      #processes {}
    end

  end
end