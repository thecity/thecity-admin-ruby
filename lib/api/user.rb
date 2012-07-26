module TheCity

  class User < ApiObject
    Gender = {:male => 'Male', :female => 'Female'}
    PhoneType = {:home => 'Home', :work => 'Work', :mobile => 'Mobile'}
    MaritalStatus = {:never_married => 'Never Married', :engaged => 'Engaged', 
                     :married => 'Married', :separated => 'Separated', 
                     :divorced => 'Divorced', :remarried => 'Re-Married',
                     :widowed => 'Widowed', :cohabiting => 'Cohabiting'}

    
    tc_attr_accessor :admin_url,
                     :api_url,
                     :internal_url,
                     :updated_at,
                     :last_logged_in,
                     :secondary_phone,
                     :last_engaged,
                     :title,
                     :internal_url,
                     :id,
                     :first,
                     :primary_campus_name,
                     :last,
                     :head_of_household,
                     :nickname,
                     :active,
                     :primary_phone_type,
                     :primary_phone,
                     :member_since,
                     :birthdate,
                     :email_bouncing,
                     :secondary_phone_type,
                     :primary_campus_id,
                     :contact_updated_at,
                     :type,
                     :staff,
                     :created_at,
                     :gender,
                     :external_id_1,
                     :external_id_2,
                     :external_id_3,
                     :middle,
                     :email       


    # Loads the user by the specified ID.
    #
    # @param user_id The ID of the user to load.
    #
    # Returns a new {User} object.
    def self.load_user_by_id(user_id)
      user_reader = UserReader.new(user_id)
      self.new(user_reader)
    end       


    # Constructor.
    #
    # @param reader (optional) The object that has the data.  This can be a {UserReader} or Hash object.
    # @param options (optional) Options for including more information.
    def initialize(reader = nil, options = {})    
      @writer_object = UserWriter
      if reader.is_a?(UserReader)
        initialize_from_json_object(reader.load_feed) 
      elsif reader.is_a?(Hash)
        initialize_from_json_object(reader)
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
    #
    # @return A string of the full name
    def full_name
      use_name = self.nickname.to_s.empty? ? self.first : self.nickname
      [use_name, self.last].compact.join(' ')
    end


    # Address information.
    #
    # @return [UserAddressList]
    def addresses
      return @address_list unless @address_list.nil?  
      return nil unless self.id

      reader = UserAddressListReader.new(self.id)    
      @address_list = UserAddressList.new(reader)
      return @address_list
    end


    # The family information.
    #
    # @return [UserFamilyList]
    def family
      return @family_list unless @user_list.nil?  
      return nil unless self.id

      reader = UserFamilyListReader.new(self.id)    
      @family_list = UserFamilyList.new(reader)
      return @family_list
    end


    # The notes for this user.
    #
    # @return [UserNoteList]
    def notes
      return @note_list unless @note_list.nil?  
      return nil unless self.id

      reader = UserNoteListReader.new(self.id)    
      @note_list = UserNoteList.new(reader)
      return @note_list
    end    


    # The roles for this user.
    #
    # @return [UserRoleList]
    def roles
      return @role_list unless @role_list.nil?  
      return nil unless self.id

      reader = UserRoleListReader.new(self.id)    
      @role_list = UserRoleList.new(reader)
      return @role_list
    end      


    # The skills for this user.
    #
    # @return [UserSkillList]
    def skills
      return @skill_list unless @skill_list.nil?  
      return nil unless self.id

      reader = UserSkillListReader.new(self.id)    
      @skill_list = UserSkillList.new(reader)
      return @skill_list
    end     


    # The processes for this user.
    #
    # @return [UserProcessList]
    def processes
      return @process_list unless @process_list.nil?  
      return nil unless self.id

      reader = UserProcessListReader.new(self.id)    
      @process_list = UserProcessList.new(reader)
      return @process_list
    end   


    # The invitations for this user.
    #
    # @return [UserInvitationList]
    def invitations
      return @invitation_list unless @invitation_list.nil?  
      return nil unless self.id

      reader = UserInvitationListReader.new(self.id)    
      @invitation_list = UserInvitationList.new(reader)
      return @invitation_list
    end


    # The invitations for this user.
    #
    # @return [UserAdminPrivilegeList]
    def admin_privileges
      return @admin_privilege_list unless @admin_privilege_list.nil?  
      return nil unless self.id

      reader = UserAdminPrivilegeListReader.new(self.id)    
      @admin_privilege_list = UserAdminPrivilegeList.new(reader)
      return @admin_privilege_list
    end

  end

end


