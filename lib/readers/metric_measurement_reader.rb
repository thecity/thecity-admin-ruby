module TheCity

  class MetricMeasurementReader < ApiReader

    # Constructor.
    #
    # <b>metric_id</b> The ID of the metric that the measurement belongs to.
    # <b>measurement_id</b> The ID of the measurement to load.
    # <b>CacheAdapter cacher</b> (optional) The cacher to be used to cache data.
    def initialize(metric_id, measurement_id, cacher = nil)
      @class_key = "metrics_#{metric_id}_measurements_#{measurement_id}"   
      @url_data_path = "/metrics/#{metric_id}/measurements/#{measurement_id}"
      
      # The object to store and load the cache.
      @cacher = cacher unless cacher.nil?    
    end
    
  end

end


