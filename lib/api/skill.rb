module TheCity

  class Skill < ApiObject

    attr_accessor :name, 
                  :skill_id


    # Constructor.
    #
    # @param json_data JSON data of the role.
    def initialize(json_data)
      initialize_from_json_object(json_data)
    end
    
  end

end


