module TheCityAdmin

  class TerminologyWriter < ApiWriter

    # Constructor.
    #
    # @param data The json data to save.
    def initialize(data)
      @url_action = :put
      @url_data_path = "/terminology/#{data[:term]}"   
      @url_data_params = data
      @updatable_fields = [:label]         
    end
    
  end

end


