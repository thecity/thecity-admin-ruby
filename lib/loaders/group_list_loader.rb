module TheCity

  class GroupListLoader < ApiLoader

    # Constructor.
    #
    # <b>page</b> The page number to get.  Default is 1.
    # <b>per_page</b> The number of items to show.  Default is 10.
    # <b>CacheAdapter cacher</b> (optional) The cacher to be used to cache data.
    def initialize(page = 1, per_page = 10, cacher = nil) 
      @class_key = "group_list_#{page}_#{per_page}"   
      @url_data_path = '/groups'
      
      # The object to store and load the cache.
      @cacher = cacher unless cacher.nil?    
    end

  end

end