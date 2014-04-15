module TheCity

  class GroupCheckinReader < ApiReader

    # Constructor.
    #
    # @param group_id The ID of the group to load.
    # @param checkin_id The ID of the group_checkin to load.
    # @param [CacheAdapter] cacher (optional) The cacher to be used to cache data.
    def initialize(group_id, checkin_id, by_id='id', cacher = nil)
      #@class_key = "groups_#{group_id}_checkins_#{checkin_id}"
      @url_data_path = case by_id
         when 'id'
           "/groups/#{group_id}/checkins/#{checkin_id}"
         when 'pager_number'
           "/groups/#{group_id}/checkins/by_pager_number?pager_number=#{checkin_id}"
         when 'callboard_number'
           "/groups/#{group_id}/checkins/by_callboard_number?callboard_number=#{checkin_id}"
         else
           "/groups/#{group_id}/checkins/#{checkin_id}"
      end
      #@url_data_path = "/groups/#{group_id}/checkins/#{checkin_id}"
      #@url_data_params = options

      # The object to store and load the cache.
      @cacher = cacher unless cacher.nil?
    end

  end

end


