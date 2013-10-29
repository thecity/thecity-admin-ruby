module TheCityAdmin

  class MetricMeasurement < ApiObject

    tc_attr_accessor :id, 
                     :created_at, 
                     :value


    # Constructor.
    #
    # @param json_data JSON data of the role.
    def initialize(json_data)
      initialize_from_json_object(json_data)
    end

    # Save this object.
    #
    # @return True on success, otherwise false.
    def save
      writer = MetricMeasurementWriter.new(self.to_attributes) 
      writer.save_feed
    end
    
  end

end


