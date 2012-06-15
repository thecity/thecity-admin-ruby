module TheCity

  class GroupWriter < ApiWriter

    # Constructor.
    #
    # @param data The json data to save.
    def initialize(data)
      if data[:id]
        @url_action = :put
        @url_data_path = "/groups/#{data[:id]}"   
      else
        @url_action = :post   
        @url_data_path = "/groups"   
      end

      @url_data_params = data
    end
    
  end

end


