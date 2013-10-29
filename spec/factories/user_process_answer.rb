module TheCityAdmin
  FactoryGirl.define do

    factory :user_process_answer, :class => TheCityAdmin::UserProcessAnswer do
      question_id 316
      question "Do you like foo?"
      answer "bar"
      answered_at Date.today
      required true
    end

  end
end
