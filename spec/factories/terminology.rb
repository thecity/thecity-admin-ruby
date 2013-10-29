module TheCityAdmin
  FactoryGirl.define do
    
    factory :terminology, :class => TheCityAdmin::Terminology do
       term 'CG'
       label 'Life'
    end

  end
end
