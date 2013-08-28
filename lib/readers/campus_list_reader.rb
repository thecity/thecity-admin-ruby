module TheCity

  class CampusListReader < ApiReader

    # Constructor.
    #
    # @param options A hash of options for requesting data from the server. Adds default of page 1 if page not set.
    # @param [CacheAdapter] cacher (optional) The cacher to be used to cache data.
    def initialize(options = {}, cacher = nil) 
      options[:page] ||= 1

      #@class_key = "group_list_#{options[:page]}_{some_kind_of_md5_thing_here}"  
      @url_data_path = "/campuses"
      @url_data_params = white_list_options(options)
      
      # The object to store and load the cache.
      @cacher = cacher unless cacher.nil?    
    end

    def white_list_options(options)
      white_list = [:page]
      options.clone.delete_if { |key, value| !white_list.include?(key) }
    end

  end

end
