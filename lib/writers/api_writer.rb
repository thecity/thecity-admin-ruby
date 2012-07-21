module TheCity

  # This adapter is the standard for all saving objects.
  class ApiWriter
    attr_reader :error_messages

    # saves this object.
    #
    # @return True or ID on success, otherwise false.
    def save_feed
      @url_data_params ||= {}
      success = true

      begin
        json = TheCity::admin_request(@url_action, @url_data_path, @url_data_params)   
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