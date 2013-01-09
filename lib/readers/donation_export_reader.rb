module TheCity

  class DonationExportReader < ApiReader

    # Constructor.
    #
    # @param donation_export_id The ID of the donation export to load.
    # @param options A hash of options for requesting data from the server.
    # @param cacher (optional) The CacheAdapter cacher to be used to cache data.
    def initialize(donation_export_id, options = {}, cacher = nil)
      #@class_key = "donation_export_#{donation_export_id}"   
      @url_data_path = "/donations/exports/#{group_export_id}"
      @url_data_params = options
      
      # The object to store and load the cache.
      @cacher = cacher unless cacher.nil?    
    end
    
  end

end


