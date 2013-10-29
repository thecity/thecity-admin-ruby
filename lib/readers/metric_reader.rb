module TheCityAdmin

  class MetricReader < ApiReader

    # Constructor.
    #
    # <b>metric_id</b> The ID of the metric to load.
    # <b>CacheAdapter cacher</b> (optional) The cacher to be used to cache data.
    def initialize(metric_id, cacher = nil)
      #@class_key = "metrics_#{metric_id}"   
      @url_data_path = "/metrics/#{metric_id}"
      
      # The object to store and load the cache.
      @cacher = cacher unless cacher.nil?    
    end
    
  end

end


