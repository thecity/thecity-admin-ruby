module TheCity

  class UserSkillWriter < ApiWriter

    # Constructor.
    #
    # @param data The json object data to save.
    def initialize(data)    
      @url_action = :post   
      @url_data_path = "/users/#{data[:user_id]}/skills"   
      @url_data_delete_path = "/users/#{data[:user_id]}/skills/#{data[:skill_id] || data[:name]}"   
      
      # user_id is not an option to submit with this path.
      data.delete(:user_id)
      
      @url_data_params = data
    end
    
  end

end


