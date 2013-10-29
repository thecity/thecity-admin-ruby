module TheCityAdmin

  class MetricMeasurementValuesReader < ApiReader

    # Constructor.
    #
    # @param options A hash of options for requesting data from the server.
    #                :: metric_id is required
    # @param [CacheAdapter] cacher (optional) The cacher to be used to cache data.
    def initialize(options = {}, cacher = nil) 
      metric_id = options.delete(:metric_id)
      @url_data_path = "/metrics/#{metric_id}/measurements/values"
      
      # The object to store and load the cache.
      @cacher = cacher unless cacher.nil?    
    end
    
  end

end


