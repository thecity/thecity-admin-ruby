module TheCity

  class UserCountReader < ApiReader

    # Constructor.
    #
    # @param options (optional) Options for including more information.
    # @param [CacheAdapter] cacher (optional) The cacher to be used to cache data.
    #
    # Options:
    #   :filter - The Reader to use to load the data.
    #
    #
    # Examples:
    #   UserCount.new
    #
    #   UserCount.new({:filter => :created_in_the_last_7_Days})
    def initialize(options = {}, cacher = nil)
      #@class_key = "users_count_#{options[:filter] || ''}"   
      @url_data_path = "/users/count"

      @url_data_params = {:filter => options[:filter] || ''}    

      # The object to store and load the cache.
      @cacher = cacher unless cacher.nil?    
    end
    
  end

end


