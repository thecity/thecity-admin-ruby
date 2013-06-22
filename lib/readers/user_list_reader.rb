module TheCity

  class UserListReader < ApiReader

    # Constructor.
    #
    # @param options A hash of options for requesting data from the server.
    # @param [CacheAdapter] cacher (optional) The cacher to be used to cache data.
    def initialize(options = {}, cacher = nil) 
      options[:page] ||= 1

      #@class_key = "user_list_#{page}_#{filter.to_s.downcase.gsub(' ','')}"   
      @url_data_path = "/users"
      @url_data_params = options
      
      # The object to store and load the cache.
      @cacher = cacher unless cacher.nil?    
    end

  end

end