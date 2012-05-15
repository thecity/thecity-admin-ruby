module TheCity

  class AdminPrivilegeListLoader < ApiLoader

    # Constructor.
    #
    # <b>user_id</b> The user ID to load the admin privileges for.
    # <b>page</b> The page number to get.  Default is 1.   
    # <b>CacheAdapter cacher</b> (optional) The cacher to be used to cache data.
    def initialize(user_id, page = 1, cacher = nil)      
      @class_key = "users_#{user_id}_admin_privileges_#{page}"   
      @url_data_path = "/users/#{user_id}/admin_privileges"
      @user_data_params = {:page => page}
      
      # The object to store and load the cache.
      @cacher = cacher unless cacher.nil?    
    end

  end

end