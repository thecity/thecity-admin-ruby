module TheCity

  class TagGroupListReader < ApiReader

    # Constructor.
    #
    # @param options A hash of options for requesting data from the server.
    # @param [CacheAdapter] cacher (optional) The cacher to be used to cache data.
    def initialize(options = {}, cacher = nil) 
      options[:page] ||= 1
      tag_id = options.delete(:tag_id)
      #@class_key = "tag_#{tag_id}_group_list_#{page}"   
      @url_data_path = "/tags/#{tag_id}/groups"
      @url_data_params = options
      
      # The object to store and load the cache.
      @cacher = cacher unless cacher.nil?    
    end

  end

end
