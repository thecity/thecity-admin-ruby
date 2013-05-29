module TheCity

  class Metric < ApiObject
    tc_attr_accessor :name,
                     :category,
                     :subcategory,
                     :id,
                     :is_percent,                     
                     :description


    # Loads the metric by the specified ID.
    #
    # @param metric_id The ID of the user to load.
    #
    # Returns a new {Metric} object.
    def self.load_by_id(metric_id)
      metric_reader = MetricReader.new(metric_id)
      self.new(metric_reader.load_feed)
    end       


    # Constructor.
    #
    # @param json_data (optional) The object that has the data.
    # @param options (optional) Options for including more information.
    def initialize(json_data = nil, options = {}) 
      @writer_object = MetricWriter
      initialize_from_json_object(json_data) unless json_data.nil?   

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
  end

end


