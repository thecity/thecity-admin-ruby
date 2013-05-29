module TheCity

  class GroupRole < ApiObject

    tc_attr_accessor :created_at,
                     :title, 
                     :user_api_url, 
                     :id, 
                     :user_type,
                     :user_id, 
                     :last_engaged, 
                     :user_name, 
                     :active 



    # Constructor.
    #
    # @param json_data JSON data of the group role.
    def initialize(json_data)
      initialize_from_json_object(json_data)
    end
    
  end

end


