module TheCity

  class TerminologyReader < ApiReader

    # Constructor.
    #
    # @param term The name of the term to load.
    # @param options (optional) Options for including more information.
    # @param [CacheAdapter] cacher (optional) The cacher to be used to cache data.
    def initialize(term, options = {}, cacher = nil)
      @class_key = "terminology_#{term}"   
      @url_data_path = "/terminology/#{term}"
      
      # The object to store and load the cache.
      @cacher = cacher unless cacher.nil?    
    end
    
  end

end


