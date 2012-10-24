module TheCity

  class GroupReader < ApiReader

    # Constructor.
    #
    # @param group_id The ID of the group to load.
    # @param options A hash of options for requesting data from the server.
    # @param cacher (optional) The CacheAdapter cacher to be used to cache data.
    def initialize(group_id, options = {}, cacher = nil)
      #@class_key = "groups_#{group_id}"   
      @url_data_path = "/groups/#{group_id}"
      @url_data_params = options
      
      # The object to store and load the cache.
      @cacher = cacher unless cacher.nil?    
    end
    
  end

end


