module TheCityAdmin

  class Invitation < ApiObject

    tc_attr_accessor :created_at, 
                     :pending_approval,
                     :id,
                     :group_id,
                     :user_id,
                     :custom_message,
                     :source,
                     :email,
                     :title,
                     :name,
                     :external_id_1,
                     :external_id_2,
                     :external_id_3,
                     :member_since


    # Constructor.
    #
    # @param json_data JSON data of the invitation.
    def initialize(json_data)
      initialize_from_json_object(json_data)
    end
    
  end

end

