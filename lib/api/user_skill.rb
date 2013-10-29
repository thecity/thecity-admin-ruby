module TheCityAdmin

  class UserSkill < ApiObject

    tc_attr_accessor :user_id,
                     :name, 
                     :skill_id


    # Constructor.
    #
    # @param json_data (optional) JSON data of the user skill.
    def initialize(json_data = nil)
      @writer_object = UserSkillWriter
      initialize_from_json_object(json_data) unless json_data.nil?
    end
    
  end

end


