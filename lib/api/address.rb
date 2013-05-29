module TheCity

  class Address < ApiObject

    tc_attr_accessor :city, 
                     :created_at,
                     :latitude, 
                     :updated_at,
                     :zipcode,
                     :group_id, 
                     :group_external_id,
                     :id, 
                     :street,
                     :street2, 
                     :location_type, 
                     :privacy, 
                     :longitude, 
                     :state




    # Loads the address by the specified ID.
    #
    # @param address_id The ID of the address to load.
    #
    # Returns a new {Address} object.
    def self.load_by_id(address_id)
      reader = AddressReader.new(address_id)
      self.new(reader.load_feed)
    rescue
      nil
    end   


    # Constructor.
    #
    # @param json_data (optional) JSON data of the address.
    def initialize(json_data = nil)
      initialize_from_json_object(json_data) unless json_data.nil?
    end
    
    def save
      raise 'Address does not have a save method'
    end
    
    def delete
      raise 'Address does not have a delete method'
    end

  end

end


