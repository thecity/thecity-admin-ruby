module TheCity

  class GroupExport < ApiObject

    tc_attr_accessor :id, 
                     :state,
                     :authenticated_s3_url,
                     :created_at


    # Constructor.
    #
    # @param json_data JSON data of the group export.
    def initialize(json_data)
      initialize_from_json_object(json_data)
    end
    
  end

end


