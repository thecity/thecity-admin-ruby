module TheCity

  class AddressListLoader < ApiLoader

    # Constructor.
    #
    # <b>user_id</b> The user ID to load the addresses info for.
    # <b>CacheAdapter cacher</b> (optional) The cacher to be used to cache data.
    def initialize(user_id, cacher = nil)
      @user_id = user_id
      @class_key = "users_#{user_id}_addresses"   
      @url_data_path = "/users/#{@user_id}/addresses"
      
      # The object to store and load the cache.
      @cacher = cacher unless cacher.nil?    
    end
    
  end

end


