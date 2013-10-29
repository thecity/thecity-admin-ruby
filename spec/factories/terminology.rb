module TheCityAdmin
  FactoryGirl.define do
    
    factory :terminology, :class => TheCity::Terminology do
       term 'CG'
       label 'Life'
    end

  end
end
