module TheCityAdmin

  class GroupInvitation < ApiObject

    tc_attr_accessor :created_at, 
                     :custom_message,
                     :email,
                     :group_id,
                     :id,
                     :pending_approval,
                     :source,
                     :user_id


    # Constructor.
    #
    # @param json_data JSON data of the note.
    def initialize(json_data)
      initialize_from_json_object(json_data)
    end
    
  end

end


