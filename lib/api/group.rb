module TheCity

  class Group < ApiObject
    attr_accessor :admin_url, 
                  :api_url, 
                  :created_at, 
                  :external_description, 
                  :group_type, 
                  :id, 
                  :internal_url, 
                  :name, 
                  :nickname, 
                  :parent_id, 
                  :plaza_url, 
                  :smart_large_profile_pic, 
                  :started_as_seed


    # # Loads the user by the specified ID
    # #
    # # <b>user_id</b> The ID of the user to load.
    # #
    # # Returns a new TheCity::User object.
    # def self.load_user_by_id(user_id)
    #   user_loader = UserLoader.new(user_id)
    #   self.new(user_loader)
    # end       



    # Constructor.
    #
    # @param Mixed loader (optional) The object that has the data.  This can be a GroupLoader or Hash object.
    def initialize(loader = nil)
      if loader.is_a?(GroupLoader)
        initialize_from_json_object(loader.load_feed) 
      elsif loader.is_a?(Hash)
        initialize_from_json_object(loader)
      end

      # @family_list = nil
      # @note_list = nil
      # @role_list = nil
      # @skill_list = nil
      # @process_list = nil
      # @invitation_list = nil
      # @admin_privilege_list = nil
    end


    # # The family information.
    # def family
    #   return @family_list unless @user_list.nil?  
    #   return nil unless self.id

    #   loader = FamilyListLoader.new(self.id)    
    #   @family_list = FamilyList.new(loader)
    #   return @family_list
    # end


    # # The notes for this user.
    # def notes
    #   return @note_list unless @note_list.nil?  
    #   return nil unless self.id

    #   loader = NoteListLoader.new(self.id)    
    #   @note_list = NoteList.new(loader)
    #   return @note_list
    # end    


    # # The roles for this user.
    # def roles
    #   return @role_list unless @role_list.nil?  
    #   return nil unless self.id

    #   loader = RoleListLoader.new(self.id)    
    #   @role_list = RoleList.new(loader)
    #   return @role_list
    # end      


    # # The roles for this user.
    # def skills
    #   return @skill_list unless @skill_list.nil?  
    #   return nil unless self.id

    #   loader = SkillListLoader.new(self.id)    
    #   @skill_list = SkillList.new(loader)
    #   return @skill_list
    # end     


    # # The processes for this user.
    # def processes
    #   return @process_list unless @process_list.nil?  
    #   return nil unless self.id

    #   loader = ProcessListLoader.new(self.id)    
    #   @process_list = ProcessList.new(loader)
    #   return @process_list
    # end   


    # # The invitations for this user.
    # def invitations
    #   return @invitation_list unless @invitation_list.nil?  
    #   return nil unless self.id

    #   loader = InvitationListLoader.new(self.id)    
    #   @invitation_list = InvitationList.new(loader)
    #   return @invitation_list
    # end


    # # The invitations for this user.
    # def admin_privileges
    #   return @admin_privilege_list unless @admin_privilege_list.nil?  
    #   return nil unless self.id

    #   loader = AdminPrivilegeListLoader.new(self.id)    
    #   @admin_privilege_list = AdminPrivilegeList.new(loader)
    #   return @admin_privilege_list
    # end

  end

end


