module TheCityAdmin

  class MetricWriter < ApiWriter

    # Constructor.
    #
    # @param data The json data to save.
    def initialize(data)
      if data[:id]
        @url_action = :put
        @url_data_path = "/metrics/#{data[:id]}"   
      else
        @url_action = :post   
        @url_data_path = "/metrics"   
      end
      @url_data_delete_path = "/metrics/#{data[:id]}" 

      @url_data_params = data

      @updatable_fields = [:name,
                           :description,
                           :category,
                           :subcategory,
                           :is_percent]         
    end
    
  end

end
