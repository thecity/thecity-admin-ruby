module TheCity

  # This adapter is the standard for all loading objects.
  class ApiLoader

    # Constructor
    def initialize
    end

    # Loads the list
    #
    # Returns the data loaded in a JSON object.
    def load_feed
      if !@cacher.nil? and !@cacher.is_cache_expired?( @class_key )
        data = @cacher.get_data( @class_key )
      else
        json = TheCity::admin_request(:get, @url_data_path)        
        data = JSON.parse(json)    
        @cacher.save_data(@class_key, data) unless @cacher.nil?  
      end   

      return data
    end

  end

end