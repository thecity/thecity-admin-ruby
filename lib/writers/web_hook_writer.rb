module TheCity

  class WebHookWriter < ApiWriter

    # Constructor.
    #
    # @param data The json object data to save.
    def initialize(data)    
      @url_action = :post   
      @url_data_path = "/webhooks"   
      @url_data_delete_path = "/webhooks/#{data[:id]}"   
      
      @url_data_params = data
    end
    
  end

end


