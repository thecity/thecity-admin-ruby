module TheCityAdmin

  class GroupExportReader < ApiReader

    # Constructor.
    #
    # @param group_id The ID of the group to load.
    # @param options A hash of options for requesting data from the server.
    #                :: group_id is required
    # @param cacher (optional) The CacheAdapter cacher to be used to cache data.
    def initialize(group_export_id, options = {}, cacher = nil)
      group_id = options[:group_id]
      #@class_key = "group_export_#{group_id}_#{group_export_id}"   
      @url_data_path = "/groups/#{group_id}/exports/#{group_export_id}"
      @url_data_params = options
      
      # The object to store and load the cache.
      @cacher = cacher unless cacher.nil?    
    end
    
  end

end


