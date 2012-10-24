module TheCity

  class GroupListReader < ApiReader

    # Constructor.
    #
    # @param options A hash of options for requesting data from the server. Adds default of page 1 if page not set.
    # @param [CacheAdapter] cacher (optional) The cacher to be used to cache data.
    def initialize(options = {}, cacher = nil) 
      options[:page] ||= 1

      #@class_key = "group_list_#{options[:page]}_{some_kind_of_md5_thing_here}"  
      @url_data_path = "/groups"
      @url_data_params = options
      
      # The object to store and load the cache.
      @cacher = cacher unless cacher.nil?    
    end

  end

end
