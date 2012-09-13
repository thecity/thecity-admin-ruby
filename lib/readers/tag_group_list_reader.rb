module TheCity

  class TagGroupListReader < ApiReader

    # Constructor.
    #
    # @param tag_id The tag id to get the groups for. 
    # @param page The page number to get.  Default is 1.
    # @param options A hash of options for requesting data from the server.
    # @param [CacheAdapter] cacher (optional) The cacher to be used to cache data.
    def initialize(tag_id, page = 1, options = {}, cacher = nil) 
      #@class_key = "tag_#{tag_id}_group_list_#{page}"   
      @url_data_path = "/tags/#{tag_id}/groups"
      @url_data_params = {:page => page}
      
      # The object to store and load the cache.
      @cacher = cacher unless cacher.nil?    
    end

  end

end
