module TheCity

  class DonationReader < ApiReader

    # Constructor.
    #
    # <b>donation_id</b> The ID of the donation to load.
    # <b>CacheAdapter cacher</b> (optional) The cacher to be used to cache data.
    def initialize(donation_id, cacher = nil)
      #@class_key = "donations_#{donation_id}"   
      @url_data_path = "/donations/#{donation_id}"
      
      # The object to store and load the cache.
      @cacher = cacher unless cacher.nil?    
    end
    
  end

end


