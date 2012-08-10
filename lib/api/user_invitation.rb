module TheCity

  class UserInvitation < ApiObject

    tc_attr_accessor :created_at, 
                     :custom_message,
                     :email,
                     :group_id,
                     :user_id,
                     :id,
                     :pending_approval,
                     :source

    # Constructor.
    #
    # @param json_data (optional) JSON data of the invitation.
    def initialize(json_data = nil)
      @writer_object = UserInvitationWriter
      initialize_from_json_object(json_data)
    end
    
  end

end


