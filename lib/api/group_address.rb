module TheCity

  class GroupAddress < ApiObject

    tc_attr_accessor :city, 
                     :created_at, 
                     :latitude, 
                     :updated_at, 
                     :zipcode,
                     :id,
                     :street, 
                     :street2, 
                     :location_type, 
                     :privacy, 
                     :longitude, 
                     :state, 
                     :group_id, 
                     :group_external_id

    # Constructor.
    #
    # @param json_data (optional) JSON data of the group address.
    def initialize(json_data = nil)
      @writer_object = GroupAddressWriter
      initialize_from_json_object(json_data) unless json_data.nil?
    end
    
  end

end


