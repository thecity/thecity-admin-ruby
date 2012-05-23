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
      metric_loader = MetricLoader.new(metric_id)
      self.new(metric_loader)
    end       


    # Constructor.
    #
    # @param loader (optional) The object that has the data.  This can be a {UserLoader} or Hash object.
    def initialize(loader = nil)    
      if loader.is_a?(MetricLoader)
        initialize_from_json_object(loader.load_feed) 
      elsif loader.is_a?(Hash)
        initialize_from_json_object(loader)
      end

      @measurement_list = nil
    end


    # Address information.
    #
    # @return [UserAddressList]
    def measurements
      return @measurement_list unless @measurement_list.nil?  
      return nil unless self.id

      loader = MetricMeasurementListLoader.new(self.id)    
      @measurement_list = MetricMeasurementList.new(loader)
      return @measurement_list
    end


    # Save this object.
    #
    # @return True on success, otherwise false.
    def save
      saver = MetricSaver.new(self.to_attributes) 
      saver.save_feed
    end

  end

end


