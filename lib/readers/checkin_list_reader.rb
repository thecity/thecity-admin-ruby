module TheCityAdmin

  class CheckinListReader < ApiReader

    # Constructor.
    #
    # @param options A hash of options for requesting data from the server.
    # @param [CacheAdapter] cacher (optional) The cacher to be used to cache data.
    def initialize(options = {}, cacher = nil) 
      options[:page] ||= 1
      #@class_key = "checkin_list_#{page}"   
      @url_data_path = "/checkins"
      @url_data_params = white_list_options(options)
      
      # The object to store and load the cache.
      @cacher = cacher unless cacher.nil?    
    end

    def white_list_options(options)
      white_list = [:page, :include_checked_out]
      options.clone.delete_if { |key, value| !white_list.include?(key) }
    end

  end

end
