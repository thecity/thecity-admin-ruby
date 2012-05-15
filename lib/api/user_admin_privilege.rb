module TheCity

  class UserAdminPrivilege < ApiObject

    attr_accessor :title


    # Constructor.
    #
    # @param json_data JSON data of the note.
    def initialize(json_data)
      initialize_from_json_object(json_data)
    end
    
  end

end


