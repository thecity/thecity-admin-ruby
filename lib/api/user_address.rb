module TheCity

  class UserAddress < ApiObject

    tc_attr_accessor :user_id,
                     :id,
                     :city,
                     :state,
                     :street,
                     :street2,
                     :zipcode,
                     :longitude,
                     :latitude,
                     :location_type,
                     :privacy,
                     :created_at,
                     :updated_at


    # Constructor.
    #
    # @param json_data (optional) JSON data of the user address.
    def initialize(json_data = nil)
      @writer_object = UserAddressWriter
      initialize_from_json_object(json_data) unless json_data.nil?
    end

    def home_address?
      self.location_type.downcase == 'home'
    end
    
  end

end


