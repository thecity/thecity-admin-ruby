module TheCity

  class CheckinListByCallboardNumberReader < ApiReader

    # Constructor.
    #
    # @param callboard_number The callboard number to filter by
    # @param options A hash of options for requesting data from the server.
    # @param [CacheAdapter] cacher (optional) The cacher to be used to cache data.
    def initialize(callboard_number, options = {}, cacher = nil)
      options[:page] ||= 1
      #@class_key = "checkin_list_#{page}"
      @url_data_path = "/checkins/by_callboard_number/#{URI.escape(callboard_number)}"
      @url_data_params = white_list_options(options)

      # The object to store and load the cache.
      @cacher = cacher unless cacher.nil?
    end

    def white_list_options(options)
      white_list = [:page, :include_checked_out, :under_checkin_group_id]
      options.clone.delete_if { |key, value| !white_list.include?(key) }
    end

  end

end
