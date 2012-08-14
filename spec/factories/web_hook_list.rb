module TheCity
  FactoryGirl.define do
  
    factory :web_hook_list, :class => TheCity::WebHookList do
      total_entries 0
      total_pages 0
      per_page 15
      current_page 1
      #web_hooks {}
    end

  end
end