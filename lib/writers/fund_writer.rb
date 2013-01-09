module TheCity

  class FundWriter < ApiWriter

    # Constructor.
    #
    # @param data The json data to save.
    def initialize(data)
      if data[:id]
        @url_action = :put
        @url_data_path = "/funds/#{data[:id]}"   
      else
        @url_action = :post   
        @url_data_path = "/funds"   
      end
      @url_data_delete_path = "/funds/#{data[:id]}" 

      @url_data_params = data
    end
    
  end

end


