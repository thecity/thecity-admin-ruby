module TheCity

  class MetricMeasurementListReader < ApiReader

    # Constructor.
    #
    # @param options A hash of options for requesting data from the server.
    #                :: metric_id is required
    # @param [CacheAdapter] cacher (optional) The cacher to be used to cache data.
    def initialize(options = {}, cacher = nil) 
      options[:page] ||= 1
      metric_id = options.delete(:metric_id)
      #@class_key = "metric_#{metric_id}_measurement_list_#{page}"   
      @url_data_path = "/metrics/#{metric_id}/measurements"
      @url_data_params = white_list_options(options)
      
      # The object to store and load the cache.
      @cacher = cacher unless cacher.nil?    
    end

    def white_list_options
      white_list = [:page]
      options.clone.delete_if { |key, value| !white_list.include?(key) }
    end

  end

end
