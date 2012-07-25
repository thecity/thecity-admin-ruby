module TheCity

  class SkilledUserListReader < ApiReader

    # Constructor.
    #
    # @param page The skill id to get the users for.
    # @param page The page number to get.  Default is 1.
    # @param options A hash of options for requesting data from the server.
    # @param [CacheAdapter] cacher (optional) The cacher to be used to cache data.
    def initialize(skill_id, page = 1, options = {}, cacher = nil) 
      @class_key = "skilled_user_list_#{page}"   
      @url_data_path = "/skills/#{skill_id}/users"
      @url_data_params = {:page => page}
      
      # The object to store and load the cache.
      @cacher = cacher unless cacher.nil?    
    end

  end

end
