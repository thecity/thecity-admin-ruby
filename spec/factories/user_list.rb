module TheCity
  FactoryGirl.define do
  
    factory :user_list, :class => TheCity::UserList do |ul|
      ul.total_entries 0
      ul.total_pages 0
      ul.per_page 15
      ul.current_page 1
      #users {}
    end

  end
end