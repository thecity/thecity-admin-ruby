module TheCityAdmin

  class FamilyReader < ApiReader

    # Constructor.
    #
    # @param options A hash of options for requesting data from the server.
    # @param [CacheAdapter] cacher (optional) The cacher to be used to cache data.
    def initialize(options = {}, cacher = nil)
      id = options[:id] || options[:external_id]
     # @class_key = "family_#{id}"   
      @url_data_path = "/families/#{id}"
      @url_data_params = {}
      
      # The object to store and load the cache.
      @cacher = cacher unless cacher.nil?    
    end

  end

end
