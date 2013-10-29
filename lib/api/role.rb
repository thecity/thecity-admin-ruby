module TheCityAdmin

  class Role < ApiObject

    GroupTypes = {:cg => 'CG', :service => 'Service', :campus => 'Campus'}

    Titles = {:leader => 'Leader', :manager => 'Manager', 
              :volunteer => 'Volunteer', :participant => 'Participant'}


    tc_attr_accessor :group_name,
                     :created_at,
                     :group_api_url, 
                     :title,
                     :group_type,
                     :user_api_url, 
                     :id,
                     :user_type,
                     :group_id,
                     :user_id,
                     :last_engaged,
                     :user_name,
                     :active

    # Constructor.
    #
    # @param json_data JSON data of the group tag.
    def initialize(json_data)
      @writer_object = TagWriter
      initialize_from_json_object(json_data)
    end

    def save
      raise 'Role does not have a save method'
    end
    
    def delete
      raise 'Role does not have a delete method'
    end

  end

end
