module TheCity

  class Metric < ApiObject
    tc_attr_accessor :id,
                     :name,
                     :category,
                     :subcategory,
                     :is_percent         


    # Loads the user by the specified ID.
    #
    # @param user_id The ID of the user to load.
    #
    # Returns a new {User} object.
    def self.load_metric_by_id(metric_id)
      metric_reader = MetricReader.new(metric_id)
      self.new(metric_reader)
    end       


    # Constructor.
    #
    # @param reader (optional) The object that has the data.  This can be a {UserReader} or Hash object.
    def initialize(reader = nil)    
      if reader.is_a?(MetricReader)
        initialize_from_json_object(reader.load_feed) 
      elsif reader.is_a?(Hash)
        initialize_from_json_object(reader)
      end

      @measurement_list = nil
    end


    # Address information.
    #
    # @return [UserAddressList]
    def measurements
      return @measurement_list unless @measurement_list.nil?  
      return nil unless self.id

      reader = MetricMeasurementListReader.new(self.id)    
      @measurement_list = MetricMeasurementList.new(reader)
      return @measurement_list
    end


    # Save this object.
    #
    # @return True on success, otherwise false.
    def save
      writer = MetricWriter.new(self.to_attributes) 
      writer.save_feed
    end

  end

end


