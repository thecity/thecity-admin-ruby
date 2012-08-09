module TheCity

  class UserAddress < ApiObject

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
    # @param json_data (optional) JSON data of the user address.
    def initialize(json_data = nil)
      @writer_object = UserAddressWriter
      initialize_from_json_object(json_data) unless json_data.nil?
    end
    
  end

end


