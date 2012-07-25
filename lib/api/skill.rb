module TheCity

  class Skill < ApiObject

    tc_attr_accessor :id, 
                     :name,
                     :created_at

    # Constructor.
    #
    # @param json_data JSON data of the note.
    def initialize(json_data)
      initialize_from_json_object(json_data)
    end
    
  end

end


