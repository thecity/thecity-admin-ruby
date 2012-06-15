module TheCity

  # This adapter is the standard for all saving objects.
  class ApiWriter

    # saves this object.
    #
    # @return True on success, otherwise false.
    def save_feed
      @url_data_params ||= {}

      response = TheCity::admin_request(@url_action, @url_data_path, @url_data_params)   

      # debugger
      # asdf='save_feed'

      # Build up errors or return true.

      return true # or false
    end

  end

end