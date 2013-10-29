module TheCityAdmin
  FactoryGirl.define do
    
    factory :user_family_member, :class => TheCity::UserFamilyMember do
      name "Pastor Sam Shepherd" 
      admin_url "http://local.devthecity.org:3000/admin/users/946060874" 
      external_id_1 nil 
      birthdate "1974-11-09" 
      user_id 946060874
      barcodes [{ 
        :created_at => "04/30/2012",
        :barcode => "0987654321"
      }]
      family_role "Spouse" 
      api_url "https://api.onthecity.org/users/946060874" 
      active true 
      email "zack@onthecity.org" 
    end

  end
end







