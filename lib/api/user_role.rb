module TheCity

  class UserRole < ApiObject

    GroupTypes = {:cg => 'CG', :service => 'Service', :campus => 'Campus'}

    Titles = {:leader => 'Leader', :manager => 'Manager', 
              :volunteer => 'Volunteer', :participant => 'Participant'}

    tc_attr_accessor :group_name, 
                     :created_at, 
                     :group_api_url, 
                     :title,
                     :group_type, 
                     :group_id, 
                     :id, 
                     :last_engaged, 
                     :active


    # Constructor.
    #
    # @param json_data (optional) JSON data of the user role.
    def initialize(json_data = nil)
      @writer_object = UserRoleWriter
      initialize_from_json_object(json_data) unless json_data.nil?
    end
    
  end

end


