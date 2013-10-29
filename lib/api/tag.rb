module TheCityAdmin

  class Tag < ApiObject

    tc_attr_accessor :id,
                     :name,
                     :created_at


    # Loads the tag by the specified ID.
    #
    # @param tag_id The ID of the tag to load.
    #
    # Returns a new {Tag} object.
    def self.load_by_id(tag_id)
      reader = TagReader.new(tag_id)
      self.new(reader.load_feed)
    rescue
      nil
    end       

    # Constructor.
    #
    # @param json_data (optional) JSON data of the Tag.
    def initialize(json_data = nil)
      @writer_object = TagWriter
      initialize_from_json_object(json_data) unless json_data.nil?
    end

  end

end
