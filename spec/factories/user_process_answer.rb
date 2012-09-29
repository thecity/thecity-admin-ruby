module TheCity
  FactoryGirl.define do

    factory :user_process_answer, :class => TheCity::UserProcessAnswer do
      question_id 316
      question "Do you like foo?"
      answer "bar"
      answered_at Time.now.to_date
      required true
    end

  end
end
