module TheCity

  class UserProcessAnswer < ApiObject

    tc_attr_accessor :question_id,
                     :question,
                     :required,
                     :answered_at,
                     :answer

    # Constructor.
    #
    # @param json_data JSON data of the note.
    def initialize(json_data)
      initialize_from_json_object(json_data)
    end

  end

end


