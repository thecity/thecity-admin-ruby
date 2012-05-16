module TheCity

  class UserSkill < ApiObject

    tc_attr_accessor :name, 
                     :skill_id


    # Constructor.
    #
    # @param json_data JSON data of the user skill.
    def initialize(json_data)
      initialize_from_json_object(json_data)
    end
    
  end

end


