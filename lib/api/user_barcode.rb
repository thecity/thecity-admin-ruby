module TheCity

  class UserBarcode < ApiObject

    tc_attr_accessor :id, 
                     :barcode,
                     :created_at

    # Constructor.
    #
    # @param json_data JSON data of the user barcode.
    def initialize(json_data)
      initialize_from_json_object(json_data)
    end
    
  end

end


