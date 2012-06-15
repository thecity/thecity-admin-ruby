module TheCity

  class UserNoteListReader < ApiReader

    # Constructor.
    #
    # @param user_id The user ID to load the notes for.
    # @param page The page number to get.  Default is 1.   
    # @param [CacheAdapter] cacher (optional) The cacher to be used to cache data.
    def initialize(user_id, page = 1, cacher = nil)
      @class_key = "users_#{user_id}_notes_#{page}"   
      @url_data_path = "/users/#{user_id}/notes"
      @url_data_params = {:page => page}
      
      # The object to store and load the cache.
      @cacher = cacher unless cacher.nil?    
    end

  end

end