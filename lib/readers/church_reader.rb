module TheCity

  class ChurchReader < ApiReader

    # Constructor.
    #
    # @param options (optional) Options for including more information.
    # @param [CacheAdapter] cacher (optional) The cacher to be used to cache data.
    def initialize(options = {}, cacher = nil)
      #@class_key = "church"   
      @url_data_path = '/churches'
      
      # The object to store and load the cache.
      # @cacher = cacher unless cacher.nil?    
    end
    
  end

end


