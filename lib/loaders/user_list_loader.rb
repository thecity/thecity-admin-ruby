module TheCity

  class UserListLoader < ApiLoader

    # Constructor.
    #
    # <b>page</b> The page number to get.  Default is 1.
    # <b>CacheAdapter cacher</b> (optional) The cacher to be used to cache data.
    def initialize(page = 1, cacher = nil) 
      @class_key = "user_list_#{page}"   
      @url_data_path = "/users"
      @user_data_params = {:page => page}
      
      # The object to store and load the cache.
      @cacher = cacher unless cacher.nil?    
    end

  end

end