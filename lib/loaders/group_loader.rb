module TheCity

  class GroupLoader < ApiLoader

    # Constructor.
    #
    # <b>group_id</b> The ID of the group to load.
    # <b>CacheAdapter cacher</b> (optional) The cacher to be used to cache data.
    def initialize(group_id, cacher = nil)
      @class_key = "groups_#{group_id}"   
      @url_data_path = "/groups/#{group_id}"
      
      # The object to store and load the cache.
      @cacher = cacher unless cacher.nil?    
    end
    
  end

end


