class Users 

  def self.retrieve_message(message_id)
    json_response = epistle_service_path(:post, 'retrieve_message', {:message_id => message_id})
    data = JSON.parse(json_response)
    Message.new(data)
  end  


  
  def self.conversation_path(city_account_id, city_user_id)
    "#{EPISTLE_PATH}/accounts/#{city_account_id}/users/#{city_user_id}/conversations/create.json"
  end

end
