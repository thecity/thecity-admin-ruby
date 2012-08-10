module TheCity

  class UserRoleWriter < ApiWriter

    # Constructor.
    #
    # @param data The json object data to save.
    def initialize(data)
      if data[:id] 
        @url_action = :put
        @url_data_path = "/users/#{data[:user_id]}/roles/#{data[:id]}"   
      else
        @url_action = :post   
        @url_data_path = "/users/#{data[:user_id]}/roles"   
      end

      # user_id is not an option to submit with this path.
      data.delete(:user_id)
      
      @url_data_params = data
    end
    
  end

end


