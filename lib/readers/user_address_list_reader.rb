module TheCity

  class UserAddressListReader < ApiReader

    # Constructor.
    #
    # @param options A hash of options for requesting data from the server.
    #                :: user_id is required
    # @param [CacheAdapter] cacher (optional) The cacher to be used to cache data.
    def initialize(options = {}, cacher = nil) 
      options[:page] ||= 1
      user_id = options.delete(:user_id)
      #@class_key = "users_#{user_id}_addresses"   
      @url_data_path = "/users/#{user_id}/addresses"
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


