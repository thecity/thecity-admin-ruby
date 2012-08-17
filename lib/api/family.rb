module TheCity

  class Family < ApiObject

    tc_attr_accessor :id,
                     :external_id,
                     :created_at,
                     :family_members


    # Loads the family by the specified ID.
    #
    # @param family_id The ID of the family to load.
    #
    # Returns a new {Family} object.
    def self.load_by_id(family_id)
      reader = FamilyReader.new(family_id)
      self.new(reader.load_feed)
    rescue
      nil
    end      

    # Constructor.
    #
    # @param json_data (optional) JSON data of the Family.
    def initialize(json_data = nil)
      @family_members = []
      @writer_object = FamilyWriter
      initialize_from_json_object(json_data) unless json_data.nil?
    end


    # Alias family_members
    def members
      @family_members
    end


    def add_family_member(member)
      @family_members << member
    end

  end

end


