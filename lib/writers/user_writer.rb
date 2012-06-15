module TheCity

  class UserWriter < ApiWriter

    # Constructor.
    #
    # @param data The json object data to save.
    def initialize(data)
      if data[:id]
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


