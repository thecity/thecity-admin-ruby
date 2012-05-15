module TheCity

  class FamilyListLoader < ApiLoader
    
    # Constructor.
    #
    # <b>user_id</b> The user ID to load the family info for.
    # <b>CacheAdapter cacher</b> (optional) The cacher to be used to cache data.
    def initialize(user_id, cacher = nil)
      @class_key = "users_#{user_id}_family"   
      @url_data_path = "/users/#{user_id}/family"
      
      # The object to store and load the cache.
      @cacher = cacher unless cacher.nil?    
    end

  end

end


