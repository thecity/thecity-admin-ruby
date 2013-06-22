module TheCity

  class GroupRoleListReader < ApiReader

    # Constructor.
    #
    # @param options A hash of options for requesting data from the server.
    #                :: group_id is required
    # @param [CacheAdapter] cacher (optional) The cacher to be used to cache data.
    def initialize(options = {}, cacher = nil) 
      options[:page] ||= 1
      group_id = options.delete(:group_id)
      #@class_key = "groups_#{group_id}_roles_#{page}"   
      @url_data_path = "/groups/#{group_id}/roles"
      @url_data_params = options
      
      # The object to store and load the cache.
      @cacher = cacher unless cacher.nil?    
    end

  end

end