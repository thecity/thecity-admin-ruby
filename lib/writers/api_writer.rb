module TheCity

  # This adapter is the standard for all saving objects.
  class ApiWriter
    attr_reader :error_messages

    # Saves this object.
    #
    # @return True or ID on success, otherwise false.
    def save_object
      @url_data_params ||= {}
      success = true

      begin
        json = TheCity::admin_request(@url_action, @url_data_path, @url_data_params)   
        success = JSON.parse(json)   
      rescue Exception => e  
        @error_messages = e.message.split(',')
        success = false
      end 

      return success
    end


    # Deletes this object.
    #
    # @return True or ID on success, otherwise false.
    def delete_object
      success = true

      begin
        # @url_data_path should be the same as :put if this object is already
        # setup and mapped to an object that exists
        json = TheCity::admin_request(:delete, @url_data_path)   
        data = JSON.parse(json)   
        success = data['id'] if data['id']
      rescue Exception => e  
        @error_messages = e.message.split(',')
        success = false
      end 

      return success
    end    

  end

end