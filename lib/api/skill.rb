module TheCity

  class Skill < ApiObject

    tc_attr_accessor :name,
                     :created_at,
                     :id

    # Constructor.
    #
    # @param json_data (optional) JSON data of the Skill.
    def initialize(json_data = nil)
      @writer_object = SkillWriter
      initialize_from_json_object(json_data) unless json_data.nil?
    end
    
  end

end


