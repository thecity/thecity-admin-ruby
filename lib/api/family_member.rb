module TheCity

  class FamilyMember < ApiObject

    attr_accessor :external_id_1, 
                  :active, 
                  :admin_url, 
                  :api_url, 
                  :birthdate, 
                  :email, 
                  :family_role, 
                  :name, 
                  :user_id


    # Constructor.
    #
    # @param json_data JSON data of the family member.
    def initialize(json_data)
      initialize_from_json_object(json_data)
    end
    
  end

end


