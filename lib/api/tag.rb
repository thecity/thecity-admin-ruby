module TheCity

  class Tag < ApiObject

    tc_attr_accessor :id,
                     :name,
                     :created_at


    # Constructor.
    #
    # @param json_data JSON data of the group tag.
    def initialize(json_data)
      @writer_object = TagWriter
      initialize_from_json_object(json_data)
    end

  end

end
