module TheCity

  class AddressReader < ApiReader

    # Constructor.
    #
    # @param address_id The ID of the address to load.
    # @param options (optional) Options for including more information.
    # @param [CacheAdapter] cacher (optional) The cacher to be used to cache data.
    def initialize(address_id, options = {}, cacher = nil)
      @class_key = "address_#{address_id}"   
      @url_data_path = "/addresses/#{address_id}"
      
      # The object to store and load the cache.
      @cacher = cacher unless cacher.nil?    
    end
    
  end

end


