module TheCity

  class Metric < ApiObject
    tc_attr_accessor :id,
                     :name,
                     :description,
                     :category,
                     :subcategory,
                     :is_percent         


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


    # Measurement information.
    #
    # @return [MetricMeasurementList]
    def measurements
      return @measurement_list unless @measurement_list.nil?  
      return nil unless self.id
 
      @measurement_list = MetricMeasurementList.new({:metric_id => self.id})
      return @measurement_list
    end



    # Measurement values list information.
    #
    # @return [MetricMeasurementValues]
    def measurement_values
      return @measurement_values unless @measurement_values.nil?  
      return nil unless self.id
 
      @measurement_values = MetricMeasurementValues.new({:metric_id => self.id})
      return @measurement_values
    end    
  end

end


