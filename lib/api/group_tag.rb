module TheCityAdmin

  class GroupTag < ApiObject

    tc_attr_accessor :name,
                     :tag_id


    # Constructor.
    #
    # @param json_data JSON data of the group tag.
    def initialize(json_data)
      initialize_from_json_object(json_data)
    end
    
  end

end


