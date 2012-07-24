module TheCity

  class UserAdminPrivilege < ApiObject

    tc_attr_accessor :title,
                     :user_id,
                     :user


    # Constructor.
    #
    # @param json_data JSON data of the note.
    def initialize(json_data)
      initialize_from_json_object(json_data)
    end
    
  end

end


