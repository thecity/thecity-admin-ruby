module TheCityAdmin

  class SkillWriter < ApiWriter

    # Constructor.
    #
    # @param data The json data to save.
    def initialize(data)
      if data[:id]
        @url_action = :put
        @url_data_path = "/skills/#{data[:id]}"   
      else
        @url_action = :post   
        @url_data_path = "/skills"   
      end
      @url_data_delete_path = "/skills/#{data[:id]}" 

      @url_data_params = data
    end
    
  end

end


