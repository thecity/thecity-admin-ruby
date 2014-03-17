module TheCityAdmin

  class TagReader < ApiReader

    # Constructor.
    #
    # @param tag_id The ID of the tag to load.
    # @param options (optional) Options for including more information.
    # @param [CacheAdapter] cacher (optional) The cacher to be used to cache data.
    def initialize(tag_id, options = {}, cacher = nil)
      #@class_key = "tags_#{tag_id}"   
      @url_data_path = "/tags/#{tag_id}"
      
      # The object to store and load the cache.
      @cacher = cacher unless cacher.nil?    
    end
    
  end

end


