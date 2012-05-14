module TheCity

  class Note < ApiObject

    attr_accessor :created_at, 
                  :custom_message,
                  :email,
                  :group_id,
                  :id,
                  :pending_approval,
                  :source


    # Constructor.
    #
    # @param json_data JSON data of the note.
    def initialize(json_data)
      initialize_from_json_object(json_data)
    end
    
  end

end


