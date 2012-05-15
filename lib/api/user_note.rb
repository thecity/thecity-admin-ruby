module TheCity

  class UserNote < ApiObject

    attr_accessor :author, 
                  :author_id, 
                  :created_at, 
                  :id, 
                  :updated_at, 
                  :visible_to


    # Constructor.
    #
    # @param json_data JSON data of the note.
    def initialize(json_data)
      initialize_from_json_object(json_data)
    end
    
  end

end


