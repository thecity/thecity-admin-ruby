module TheCity

  class FundReader < ApiReader

    # Constructor.
    #
    # <b>fund_id</b> The ID of the fund to load.
    # <b>CacheAdapter cacher</b> (optional) The cacher to be used to cache data.
    def initialize(fund_id, cacher = nil)
      #@class_key = "funds_#{fund_id}"   
      @url_data_path = "/funds/#{fund_id}"
      
      # The object to store and load the cache.
      @cacher = cacher unless cacher.nil?    
    end
    
  end

end


