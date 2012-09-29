module TheCity

  class UserProcessAnswerListReader < ApiReader

    # Constructor.
    #
    # @param options A hash of options for requesting data from the server.
    #                :: user_id and process_id are required
    # @param [CacheAdapter] cacher (optional) The cacher to be used to cache data.
    def initialize(options = {}, cacher = nil)
      page = options[:page] || 1
      user_id = options[:user_id]
      process_id = options[:process_id]
      #@class_key = "users_#{user_id}_processes_#{page}"
      @url_data_path = "/users/#{user_id}/processes/#{process_id}/answers"
      @url_data_params = {:page => page}

      # The object to store and load the cache.
      @cacher = cacher unless cacher.nil?
    end

  end

end