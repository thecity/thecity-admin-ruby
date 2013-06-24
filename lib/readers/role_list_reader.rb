module TheCity

  class RoleListReader < ApiReader

    # Constructor.
    #
    # @param options A hash of options for requesting data from the server.
    # @param [CacheAdapter] cacher (optional) The cacher to be used to cache data.
    def initialize(options = {}, cacher = nil)
      options[:page] ||= 1
      #@class_key = "role_list_#{page}"   
      @url_data_path = "/roles"
      @url_data_params = white_list_options(options)
      
      # The object to store and load the cache.
      @cacher = cacher unless cacher.nil?    
    end

    def white_list_options
      white_list = [:page, :under_group_id, :group_types, :titles]
      options.clone.delete_if { |key, value| !white_list.include?(key) }
    end

  end

end