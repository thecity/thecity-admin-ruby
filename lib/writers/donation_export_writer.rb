module TheCityAdmin

  class DonationExportWriter < ApiWriter

    # Constructor.
    #
    # @param data The json data to save.
    def initialize(data)
      if data[:id]
        @url_action = :put
        @url_data_path = nil # not implemented
      else
        @url_action = :post   
        @url_data_path = '/donations/exports'   
      end
      @url_data_delete_path = "/donations/exports/#{data[:id]}" 

      @url_data_params = data
    end
    
  end

end


