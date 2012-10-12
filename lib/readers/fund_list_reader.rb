module TheCity

  class FundListReader < ApiReader

    # Constructor.
    #
    # @param page The page number to get.  Default is 1.
    # @param options A hash of options for requesting data from the server.
    # @param [CacheAdapter] cacher (optional) The cacher to be used to cache data.
    def initialize(options = {}, cacher = nil) 
      options[:page] ||= 1

      #@class_key = "pledge_list_#{options[:page]}_{some_kind_of_md5_thing_here}"  
      @url_data_path = "/funds"
      @url_data_params = options
      
      # The object to store and load the cache.
      @cacher = cacher unless cacher.nil?    
    end

  end

end
