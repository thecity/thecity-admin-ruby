module TheCity

  class UserRoleListLoader < ApiLoader

    attr_reader :total_entries, :total_pages, :per_page, :current_page

    # Constructor.
    #
    # <b>user_id</b> The user ID to load the roles for.
    # <b>page</b> The page number to get.  Default is 1.
    # <b>per_page</b> The number of items to show.  Default is 10.    
    # <b>CacheAdapter cacher</b> (optional) The cacher to be used to cache data.
    def initialize(user_id, page = 1, per_page = 10, cacher = nil)
      @user_id = user_id
      @class_key = "users_#{user_id}_roles_#{page}_#{per_page}"   
      @url_data_path = "/users/#{@user_id}/roles"
      
      # The object to store and load the cache.
      @cacher = cacher unless cacher.nil?    
    end

  end

end