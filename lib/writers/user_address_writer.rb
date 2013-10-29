module TheCityAdmin

  class UserAddressWriter < ApiWriter

    # Constructor.
    #
    # @param data The json object data to save.
    def initialize(data)
      if data[:id] 
        @url_action = :put
        @url_data_path = "/users/#{data[:user_id]}/addresses/#{data[:id]}"   
      else
        @url_action = :post   
        @url_data_path = "/users/#{data[:user_id]}/addresses"   
      end
      @url_data_delete_path = "/users/#{data[:user_id]}/addresses/#{data[:id]}" 

      @url_data_params = data


      @updatable_fields = [:city,
                           :zipcode,
                           :street,
                           :location_type,
                           :state]      
    end
    
  end

end


