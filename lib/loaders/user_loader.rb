module TheCity

  class UserLoader < ApiLoader

    # Constructor.
    #
    # <b>user_id</b> The ID of the user to load.
    # <b>CacheAdapter cacher</b> (optional) The cacher to be used to cache data.
    def initialize(user_id, cacher = nil)
      @user_id = user_id
      @class_key = "users_#{user_id}"   
      @url_data_path = "/users/#{@user_id}"
      
      # The object to store and load the cache.
      @cacher = cacher unless cacher.nil?    
    end
    
  end

end


