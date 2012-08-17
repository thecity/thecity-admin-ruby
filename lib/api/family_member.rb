module TheCity

  class FamilyMember < ApiObject

    Roles = {:spouse => 'Spouse', :child => 'Child', :temp_child => 'TempChild', :legal_child => 'LegalChild'}

    tc_attr_accessor :name,
                     :admin_url,
                     :external_id_1,
                     :birthdate,
                     :user_id,
                     :barcodes,
                     :family_role,
                     :api_url,
                     :active,
                     :email

    # Constructor.
    #
    # @param json_data (optional) JSON data of the Family member.
    def initialize(json_data = nil)
      initialize_from_json_object(json_data) unless json_data.nil?
    end
  end

end


