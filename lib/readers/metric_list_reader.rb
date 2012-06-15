module TheCity

  class MetricListReader < ApiReader

    # Constructor.
    #
    # @param page The page number to get.  Default is 1.
    # @param options A hash of options for requesting data from the server.
    # @param [CacheAdapter] cacher (optional) The cacher to be used to cache data.
    def initialize(page = 1, options = {}, cacher = nil) 
      @class_key = "metric_list_#{page}"   
      @url_data_path = "/metrics"
      @url_data_params = {:page => page}
      
      # The object to store and load the cache.
      @cacher = cacher unless cacher.nil?    
    end

  end

end
