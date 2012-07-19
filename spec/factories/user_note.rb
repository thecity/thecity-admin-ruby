
module TheCity
  FactoryGirl.define do
    
    factory :user_note, :class => TheCity::UserNote do
      created_at "05/08/2012" 
      body "Deaconship is complete" 
      author "Pastor Sam Shepherd" 
      updated_at "05/08/2012" 
      id 756434911 
      visible_to [ 
        "Account Admin",
        "User Admin" 
      ] 
      author_id 946060874
      file_attachments [
      {
        :authenticated_s3_url => "https://aws....",
        :filename => "list_of_sins.pdf"
      }]
    end

  end
end




