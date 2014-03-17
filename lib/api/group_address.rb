module TheCityAdmin

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
                     :group_id, 
                     :zipcode


    # Constructor.
    #
    # @param json_data (optional) JSON data of the group address.
    def initialize(json_data = nil)
      @writer_object = GroupAddressWriter
      initialize_from_json_object(json_data) unless json_data.nil?
    end
    
  end

end


