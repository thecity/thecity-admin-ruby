module TheCity

  class UserWriter < ApiWriter

    # Constructor.
    #
    # @param data The json object data to save.
    def initialize(data)
      if data[:id] and data[:marked_for_destruction]
        data.delete(:marked_for_destruction) # do not send this to the server.
        @url_action = :delete
        @url_data_path = "/users/#{data[:id]}"   
      elsif data[:id]
        @url_action = :put
        @url_data_path = "/users/#{data[:id]}"   
      else
        @url_action = :post   
        @url_data_path = "/users"   
      end

      @url_data_params = data
    end
    
  end

end


