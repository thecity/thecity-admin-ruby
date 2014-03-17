module TheCityAdmin

  class TagWriter < ApiWriter

    # Constructor.
    #
    # @param data The json data to save.
    def initialize(data)
      if data[:id]
        @url_action = :put
        @url_data_path = "/tags/#{data[:id]}"   
      else
        @url_action = :post   
        @url_data_path = "/tags"   
      end
      @url_data_delete_path = "/tags/#{data[:id]}" 

      @url_data_params = data

      @updatable_fields = [:name]         
    end
    
  end

end


