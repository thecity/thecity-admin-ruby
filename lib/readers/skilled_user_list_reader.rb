module TheCity

  class SkilledUserListReader < ApiReader

    # Constructor.
    #
    # @param options A hash of options for requesting data from the server.
    #                :: skill_id is required
    # @param [CacheAdapter] cacher (optional) The cacher to be used to cache data.
    def initialize(options = {}, cacher = nil) 
      options[:page] ||= 1
      skill_id = options.delete(:skill_id)
      #@class_key = "skilled_user_list_#{page}"   
      @url_data_path = "/skills/#{skill_id}/users"
      @url_data_params = white_list_options(options)
      
      # The object to store and load the cache.
      @cacher = cacher unless cacher.nil?    
    end

    def white_list_options
      white_list = [:page]
      options.clone.delete_if { |key, value| !white_list.include?(key) }
    end

  end

end
