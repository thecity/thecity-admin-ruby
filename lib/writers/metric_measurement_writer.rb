module TheCityAdmin

  class MetricMeasurementWriter < ApiWriter

    # Constructor.
    #
    # @param data The json data to save.
    def initialize(data)
      if data[:id]
        @url_action = :put
        @url_data_path = "/metrics/#{data[:metric_id]}/measurements/#{data[:id]}"   
      else
        @url_action = :post   
        @url_data_path = "/metrics/#{data[:metric_id]}/measurements"   
      end
      @url_data_delete_path = "/metrics/#{data[:metric_id]}/measurements/#{data[:id]}"

      @url_data_params = data
    end
    
  end

end


