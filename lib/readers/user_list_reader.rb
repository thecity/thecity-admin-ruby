module TheCityAdmin

  class UserListReader < ApiReader

    # Constructor.
    #
    # @param options A hash of options for requesting data from the server.
    # @param [CacheAdapter] cacher (optional) The cacher to be used to cache data.
    def initialize(options = {}, cacher = nil) 
      options[:page] ||= 1

      #@class_key = "user_list_#{page}_#{filter.to_s.downcase.gsub(' ','')}"   
      @url_data_path = "/users"
      @url_data_params = white_list_options(options)
      
      # The object to store and load the cache.
      @cacher = cacher unless cacher.nil?    
    end

    def white_list_options(options)
      white_list = [:page, :per_page, :filter, :include_participation, :include_custom_fields, :include_barcodes, :include_addresses, :include_family]
      options.clone.delete_if { |key, value| !white_list.include?(key) }
    end

  end

end
