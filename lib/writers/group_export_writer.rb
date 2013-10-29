module TheCityAdmin

  class GroupExportWriter < ApiWriter

    # Constructor.
    #
    # @param data The json data to save.
    def initialize(data)
      if data[:id]
        @url_action = :put
        @url_data_path = nil # not implemented
      else
        @url_action = :post   
        @url_data_path = "/groups/#{data[:group_id]}/exports"   
      end
      @url_data_delete_path = nil # not implemented

      @url_data_params = data
    end
    
  end

end


