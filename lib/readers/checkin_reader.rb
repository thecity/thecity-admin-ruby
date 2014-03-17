module TheCityAdmin

  class CheckinReader < ApiReader

    # Constructor.
    #
    # @param checkin_id The ID of the checkin to load.
    # @param options (optional) Options for including more information.
    # @param [CacheAdapter] cacher (optional) The cacher to be used to cache data.
    def initialize(checkin_id, options = {}, cacher = nil)
      #@class_key = "checkin_#{tag_id}"   
      @url_data_path = "/checkins/#{tag_id}"
      
      # The object to store and load the cache.
      @cacher = cacher unless cacher.nil?    
    end
    
  end

end


