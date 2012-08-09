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
      group_reader = GroupReader.new(group_id)
      self.new(group_reader)
    end       



    # Constructor.
    #
    # @param reader (optional) The object that has the data.  This can be a {GroupReader} or Hash object.
    def initialize(reader = nil)
      if reader.is_a?(GroupReader)
        initialize_from_json_object(reader.load_feed) 
      elsif reader.is_a?(Hash)
        initialize_from_json_object(reader)
      end

      @address_list = nil
      @checkin_list = nil
      @invitations = nil
      @role_list = nil
      @tag_list = nil
    end


    # The address information.
    #
    # @return [GroupAddressList]
    def addresses
      return @address_list unless @address_list.nil?  
      return nil unless self.id

      @address_list = GroupAddressList.new({:group_id => self.id})
      return @address_list
    end
    

    # The checkin information.
    #
    # @return [GroupCheckinList]
    def checkins
      return @checkin_list unless @checkin_list.nil?  
      return nil unless self.id

      @checkin_list = GroupCheckinList.new({:group_id => self.id})
      return @checkin_list
    end


    # The invitations for this group.
    #
    # @return [GroupInvitationList]
    def invitations
      return @invitation_list unless @invitation_list.nil?  
      return nil unless self.id
 
      @invitation_list = GroupInvitationList.new({:group_id => self.id})
      return @invitation_list
    end


    # The roles for this group.
    #
    # @return [GroupRoleList]
    def roles
      return @role_list unless @role_list.nil?  
      return nil unless self.id
 
      @role_list = GroupRoleList.new({:group_id => self.id})
      return @role_list
    end     


    # The tags for this group.
    #
    # @return [GroupTagList]
    def tags
      return @tag_list unless @tag_list.nil?  
      return nil unless self.id
  
      @tag_list = GroupTagList.new({:group_id => self.id})
      return @tag_list
    end     



    # Save this object.
    #
    # @return True on success, otherwise false.
    def save
      writer = GroupWriter.new(self.to_attributes) 
      writer.save_feed
    end

  end

end


