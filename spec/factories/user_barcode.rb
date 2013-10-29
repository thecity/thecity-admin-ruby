module TheCityAdmin
  FactoryGirl.define do
    
    factory :user_barcode, :class => TheCityAdmin::UserBarcode do
      barcode "234234234"
      id 1012338309
      created_at "05/16/2012"
    end

  end
end




