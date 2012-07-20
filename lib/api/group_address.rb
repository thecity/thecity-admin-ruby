module TheCity

  class GroupAddress < ApiObject

    tc_attr_accessor :city, 
                     :created_at, 
                     :id, 
                     :latitude, 
                     :location_type, 
                     :longitude, 
                     :privacy, 
                     :state, 
                     :street, 
                     :updated_at, 
                     :user_id, 
                     :zipcode


    # Constructor.
    #
    # @param json_data JSON data of the user address.
    def initialize(json_data)
      initialize_from_json_object(json_data)
    end
    
  end

end


