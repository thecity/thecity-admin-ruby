module TheCity

  class User < ApiObject

    attr_accessor :active,
                  :admin_url,
                  :api_url,
                  :birthdate,
                  :contact_updated_at,
                  :created_at,
                  :email,
                  :email_bouncing,
                  :external_id_1,
                  :external_id_2,
                  :external_id_3,
                  :first,
                  :gender,
                  :head_of_household,
                  :id,
                  :last,
                  :last_engaged,
                  :last_logged_in,
                  :marital_status,
                  :member_since,
                  :middle,
                  :nickname,
                  :primary_phone,
                  :primary_phone_type,
                  :secondary_phone,
                  :secondary_phone_type,
                  :staff,
                  :title,
                  :type,
                  :updated_at



    def initialize(user_attributes)
      load_data(user_attributes)
    end
    

    def full_name
      use_name = self.nickname || self.first
      [use_name, self.last].join(' ')
    end
  end

end


