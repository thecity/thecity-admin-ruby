module TheCity

  class GroupCheckin < ApiObject

    tc_attr_accessor :city,
                     :created_at,
                     :latitude,
                     :updated_at,
                     :zipcode,
                     :id,
                     :street,
                     :location_type,
                     :privacy,
                     :longitude,
                     :state,
                     :group_id


    # Constructor.
    #
    # @param json_data JSON data of the group checkin.
    def initialize(json_data)
      initialize_from_json_object(json_data)
    end
    
  end

end


