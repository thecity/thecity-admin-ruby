module TheCityAdmin
  FactoryGirl.define do

    factory :user_process_answer_list, :class => TheCity::UserProcessAnswerList do
      total_entries 0
      total_pages 0
      per_page 15
      current_page 1
    end

  end
end
