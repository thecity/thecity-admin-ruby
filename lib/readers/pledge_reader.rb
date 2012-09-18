module TheCity

  class PledgeReader < ApiReader

    # Constructor.
    #
    # <b>pledge_id</b> The ID of the pledge to load.
    # <b>CacheAdapter cacher</b> (optional) The cacher to be used to cache data.
    def initialize(pledge_id, cacher = nil)
      #@class_key = "pledges_#{pledge_id}"   
      @url_data_path = "/pledges/#{pledge_id}"
      
      # The object to store and load the cache.
      @cacher = cacher unless cacher.nil?    
    end
    
  end

end


