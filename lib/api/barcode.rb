module TheCity

  class Barcode < ApiObject

    tc_attr_accessor :user_id, 
                     :user_name, 
                     :id, 
                     :created_at, 
                     :barcode

    # Loads the barocde by the specified ID.
    #
    # @param barcode_id The ID of the barcode to load.
    #
    # Returns a new {Barcode} object.
    def self.load_by_id(barcode_id)
      reader = BarcodeReader.new(barcode_id)
      self.new(reader.load_feed)
    rescue
      nil
    end


    # Constructor.
    #
    # @param json_data (optional) JSON data of the barcode.
    def initialize(json_data = nil)
      initialize_from_json_object(json_data) unless json_data.nil?
    end
    
    def save
      raise 'Barcode does not have a save method'
    end
    
    def delete
      raise 'Barcode does not have a delete method'
    end

  end

end


