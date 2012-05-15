module TheCity

  class GroupAddressListLoader < ApiLoader

    # Constructor.
    #
    # <b>group_id</b> The group ID to load the addresses info for.
    # <b>CacheAdapter cacher</b> (optional) The cacher to be used to cache data.
    def initialize(group_id, cacher = nil)
      @class_key = "groups_#{group_id}_addresses"   
      @url_data_path = "/groups/#{group_id}/addresses"
      
      # The object to store and load the cache.
      @cacher = cacher unless cacher.nil?    
    end
    
  end

end


