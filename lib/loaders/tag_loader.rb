module TheCity

  class TagListLoader < ApiLoader

    attr_reader :total_entries, :total_pages, :per_page, :current_page

    # Constructor.
    #
    # <b>page</b> The page number to get.  Default is 1.
    # <b>per_page</b> The number of items to show.  Default is 10.
    # <b>CacheAdapter cacher</b> (optional) The cacher to be used to cache data.
    def initialize(page = 1, per_page = 10, cacher = nil) 
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