module TheCity

  class UserRole < ApiObject

    attr_accessor :active, 
                  :created_at, 
                  :group_api_url, 
                  :group_id, 
                  :group_name, 
                  :group_type, 
                  :id, 
                  :last_engaged, 
                  :title


    # Constructor.
    #
    # @param json_data JSON data of the role.
    def initialize(json_data)
      initialize_from_json_object(json_data)
    end
    
  end

end


