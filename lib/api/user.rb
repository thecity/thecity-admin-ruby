module TheCity

  class User < ApiObject
    attr_accessor :active,
                  :admin_url,
                  :api_url,
                  :birthdate,
                  :contact_updated_at,
                  :created_at,
                  :email,
                  :email_bouncing,
                  :external_id_1,
                  :external_id_2,
                  :external_id_3,
                  :first,
                  :gender,
                  :head_of_household,
                  :id,
                  :in_community,
                  :in_connect,
                  :in_service,
                  :last,
                  :last_attendance_date,
                  :last_checkin_date,
                  :last_donation_date,
                  :last_engaged,
                  :last_logged_in,
                  :marital_status,
                  :member_since,
                  :middle,
                  :nickname,
                  :primary_phone,
                  :primary_phone_type,
                  :secondary_phone,
                  :secondary_phone_type,
                  :spouse_id,
                  :spouse_name,
                  :staff,
                  :title,
                  :type,
                  :updated_at            


    # Loads the user by the specified ID
    #
    # <b>user_id</b> The ID of the user to load.
    #
    # Returns a new TheCity::User object.
    def self.load_user_by_id(user_id)
      user_loader = UserLoader.new(user_id)
      self.new(user_loader)
    end       



    # Constructor.
    #
    # @param Mixed loader (optional) The object that has the data.  This can be a UserLoader or Hash object.
    def initialize(loader = nil)    
      if loader.is_a?(UserLoader)
        initialize_from_json_object(loader.load_feed) 
      elsif loader.is_a?(Hash)
        initialize_from_json_object(loader)
      end

      @address_list = nil
      @family_list = nil
      @note_list = nil
      @role_list = nil
      @skill_list = nil
      @process_list = nil
      @invitation_list = nil
      @admin_privilege_list = nil
    end
    
    # The first and last name of the user.
    def full_name
      use_name = self.nickname || self.first
      [use_name, self.last].compact.join(' ')
    end

    # Address information
    def addresses
      return @address_list unless @address_list.nil?  
      return nil unless self.id

      loader = UserAddressListLoader.new(self.id)    
      @address_list = UserAddressList.new(loader)
      return @address_list
    end


    # The family information.
    def family
      return @family_list unless @user_list.nil?  
      return nil unless self.id

      loader = FamilyListLoader.new(self.id)    
      @family_list = FamilyList.new(loader)
      return @family_list
    end


    # The notes for this user.
    def notes
      return @note_list unless @note_list.nil?  
      return nil unless self.id

      loader = UserNoteListLoader.new(self.id)    
      @note_list = UserNoteList.new(loader)
      return @note_list
    end    


    # The roles for this user.
    def roles
      return @role_list unless @role_list.nil?  
      return nil unless self.id

      loader = UserRoleListLoader.new(self.id)    
      @role_list = UserRoleList.new(loader)
      return @role_list
    end      


    # The roles for this user.
    def skills
      return @skill_list unless @skill_list.nil?  
      return nil unless self.id

      loader = UserSkillListLoader.new(self.id)    
      @skill_list = UserSkillList.new(loader)
      return @skill_list
    end     


    # The processes for this user.
    def processes
      return @process_list unless @process_list.nil?  
      return nil unless self.id

      loader = ProcessListLoader.new(self.id)    
      @process_list = ProcessList.new(loader)
      return @process_list
    end   


    # The invitations for this user.
    def invitations
      return @invitation_list unless @invitation_list.nil?  
      return nil unless self.id

      loader = InvitationListLoader.new(self.id)    
      @invitation_list = InvitationList.new(loader)
      return @invitation_list
    end


    # The invitations for this user.
    def admin_privileges
      return @admin_privilege_list unless @admin_privilege_list.nil?  
      return nil unless self.id

      loader = AdminPrivilegeListLoader.new(self.id)    
      @admin_privilege_list = AdminPrivilegeList.new(loader)
      return @admin_privilege_list
    end

  end

end


