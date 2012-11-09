module TheCity

  # This adapter is the standard for all loading objects.
  class ApiReader
    attr_reader :headers

    # Constructor
    # def initialize
    # end

    # Loads the list
    #
    # @return the data loaded in a JSON object.
    def load_feed
      # if !@cacher.nil? and !@cacher.is_cache_expired?( @class_key )
      #   data = @cacher.get_data( @class_key )
      # else
        @url_data_params ||= {}
        response = TheCity::admin_request(:get, @url_data_path, @url_data_params)
        data = JSON.parse(response.body)
        @headers = parse_headers(response.headers) if response.headers
        @cacher.save_data(@class_key, data) unless @cacher.nil?
      #end   

      return data
    end

    def parse_headers(headers)
      Hash[headers.split("\r\n").collect { |pair| pair.split(': ') }]
    end

  end

end