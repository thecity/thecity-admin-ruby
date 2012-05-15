module TheCity

  class TagListLoader < ApiLoader

    # Constructor.
    #
    # <b>page</b> The page number to get.  Default is 1.
    # <b>CacheAdapter cacher</b> (optional) The cacher to be used to cache data.
    def initialize(page = 1, cacher = nil) 
      # # defaults
      # @total_entries = 0
      # @total_pages = 0
      # @per_page = 0
      # @current_page = 0

      # @class_key = "group_list_#{page}_#{per_page}"   
      # @url_data_path = '/groups'
      
      # # The object to store and load the cache.
      # @cacher = cacher unless cacher.nil?    
    end

  end

end