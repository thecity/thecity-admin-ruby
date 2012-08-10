module TheCity

  class UserRole < ApiObject

    GroupTypes = {:cg => 'CG', :service => 'Service', :campus => 'Campus'}

    Titles = {:leader => 'Leader', :manager => 'Manager', 
              :volunteer => 'Volunteer', :participant => 'Participant'}

    tc_attr_accessor :user_id,
                     :active, 
                     :created_at, 
                     :group_api_url, 
                     :group_id, 
                     :group_name, 
                     :group_type, 
                     :id, 
                     :last_engaged, 
                     :title


    # Constructor.
    #
    # @param json_data (optional) JSON data of the user role.
    def initialize(json_data = nil)
      @writer_object = UserRoleWriter
      initialize_from_json_object(json_data) unless json_data.nil?
    end
    
  end

end


