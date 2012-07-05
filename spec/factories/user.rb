module TheCity
  FactoryGirl.define do
    
    factory :user, :class => TheCity::User do
      # active
      # admin_url
      # api_url
      # birthdate
      # contact_updated_at
      # created_at
      # email
      # email_bouncing
      # external_id_1
      # external_id_2
      # external_id_3
      first 'James'
      # gender
      # head_of_household
      # id
      # in_community
      # in_connect
      # in_service
      last 'Hays'
      # last_attendance_date
      # last_checkin_date
      # last_donation_date
      # last_engaged
      # last_logged_in
      # marital_status
      # member_since
      middle 'Wesley'
      # nickname
      # primary_phone
      # primary_phone_type
      # secondary_phone
      # secondary_phone_type
      # spouse_id
      # spouse_name
      # staff
      # title
      # type
      # updated_at  
    end

  end
end