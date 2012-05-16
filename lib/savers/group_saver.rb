module TheCity

  class GroupSaver < ApiSaver

    # Constructor.
    #
    # <b>data</b> The json data to save.
    def initialize(data)
      # if data['id'].blank?
      #   @url_action = :create
      #   @url_data_path = "/groups"
      # else
      #   @url_action = :put
      #   @url_data_path = "/groups/#{data['id']}"      
      # end

      # @url_data_params = data
    end
    
  end

end


