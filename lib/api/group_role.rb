module TheCity

  class GroupRole < ApiObject

    attr_accessor :active, 
                  :created_at, 
                  :id, 
                  :last_engaged, 
                  :title, 
                  :user_api_url, 
                  :user_id, 
                  :user_name, 
                  :user_type


    # Constructor.
    #
    # @param json_data JSON data of the group role.
    def initialize(json_data)
      initialize_from_json_object(json_data)
    end
    
  end

end


