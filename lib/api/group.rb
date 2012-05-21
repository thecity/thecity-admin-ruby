module TheCity

  class Group < ApiObject
    tc_attr_accessor :admin_url, 
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


    # Loads the group by the specified ID.
    #
    # @param group_id The ID of the group to load.
    #
    # Returns a new {Group} object.
    def self.load_group_by_id(group_id)
      group_loader = GroupLoader.new(group_id)
      self.new(group_loader)
    end       



    # Constructor.
    #
    # @param loader (optional) The object that has the data.  This can be a {GroupLoader} or Hash object.
    def initialize(loader = nil)
      if loader.is_a?(GroupLoader)
        initialize_from_json_object(loader.load_feed) 
      elsif loader.is_a?(Hash)
        initialize_from_json_object(loader)
      end

      @address_list = nil
      @invitations = nil
      @role_list = nil
      @tag_list = nil
    end


    # The address information.
    #
    # @return [AddressList]
    def addresses
      return @address_list unless @address_list.nil?  
      return nil unless self.id

      loader = GroupAddressListLoader.new(self.id)    
      @address_list = GroupAddressList.new(loader)
      return @address_list
    end
    

    # The invitations for this group.
    #
    # @return [GroupInvitationList]
    def invitations
      return @invitation_list unless @invitation_list.nil?  
      return nil unless self.id

      loader = GroupInvitationListLoader.new(self.id)    
      @invitation_list = GroupInvitationList.new(loader)
      return @invitation_list
    end


    # The roles for this group.
    #
    # @return [GroupRoleList]
    def roles
      return @role_list unless @role_list.nil?  
      return nil unless self.id

      loader = GroupRoleListLoader.new(self.id)    
      @role_list = GroupRoleList.new(loader)
      return @role_list
    end     


    # The tags for this group.
    #
    # @return [GroupTagList]
    def tags
      return @tag_list unless @tag_list.nil?  
      return nil unless self.id

      loader = GroupTagListLoader.new(self.id)    
      @tag_list = GroupTagList.new(loader)
      return @tag_list
    end     



    # Save this object.
    #
    # @return True on success, otherwise false.
    def save
      saver = GroupSaver.new(self.to_attributes) 
      saver.save_feed
    end

  end

end


