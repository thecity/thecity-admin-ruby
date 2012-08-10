module TheCity

  class UserAdminPrivilegeWriter < ApiWriter

    # Constructor.
    #
    # @param data The json object data to save.
    def initialize(data)
      @url_action = :post   
      @url_data_path = "/users/#{data[:user_id]}/admin_privileges"   
    
      @url_data_params = data
    end
    

    def delete_object
      raise TheCityExceptions::TheCityResponseError.new('Unable to delete Admin Privilege')
    end

  end

end


