module TheCityAdmin
  FactoryGirl.define do
    
    factory :web_hook, :class => TheCity::WebHook do
      id 1
      event 'create'
      object 'User' 
      callback_uri 'https://mysite.com/user_create'
    end

  end
end
