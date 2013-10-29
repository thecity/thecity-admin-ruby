module TheCityAdmin
  FactoryGirl.define do
  
    factory :user_note_list, :class => TheCityAdmin::UserNoteList do
      total_entries 0
      total_pages 0
      per_page 15
      current_page 1
      #notes {}
    end

  end
end