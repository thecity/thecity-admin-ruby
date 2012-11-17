module TheCity

  class Skill < ApiObject

    tc_attr_accessor :id, 
                     :name,
                     :created_at


    # Loads the skill by the specified ID.
    #
    # @param skill_id The ID of the skill to load.
    #
    # Returns a new {Skill} object.
    def self.load_by_id(fund_id)
      skill_reader = SkillReader.new(fund_id)
      self.new(skill_reader)
    end       

    # Constructor.
    #
    # @param reader (optional) The object that has the data.  This can be a {SkillReader} or Hash object.
    def initialize(reader = nil)
      @writer_object = SkillWriter
      if reader.is_a?(SkillReader)
        initialize_from_json_object(reader.load_feed) 
      elsif reader.is_a?(Hash)
        initialize_from_json_object(reader)
      end
    end
    
  end

end


