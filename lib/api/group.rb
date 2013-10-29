module TheCityAdmin

  class Group < ApiObject
    tc_attr_accessor :campus_name,
                     :last_engaged,
                     :default_invitation_custom_message,
                     :archive_scheduled,
                     :time_zone,
                     :campus_id,
                     :group_type,
                     :parent_id,
                     :target_size,
                     :nearest_neighborhood_name,
                     :admin_url,
                     :deletion_scheduled,
                     :plaza_url,
                     :updated_at,
                     :external_description,
                     :nickname,
                     :started_as_seed,
                     :unlisted,
                     :created_at,
                     :api_url,
                     :profile_pic,
                     :inactive,
                     :internal_url,
                     :secure,
                     :nearest_neighborhood_id,
                     :name,
                     :auto_approve_invites,
                     :id,
                     :external_id,
                     :user_ids   


    # Loads the group by the specified ID.
    #
    # @param group_id The ID of the group to load.
    # @param options A hash of options for requesting data from the server.
    #
    # Returns a new {Group} object.
    def self.load_group_by_id(group_id, options = {})
      group_reader = GroupReader.new(group_id, options)
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
      @writer_object = GroupWriter

      @address_list = nil
      @checkin_list = nil
      @event_attendance_list = nil
      @export_list = nil
      @invitations = nil
      @role_list = nil
      @tag_list = nil
    end


    # The address information.
    #
    # @return [GroupAddressList]
    def addresses(force_reload = false)
      unless force_reload
        return @address_list unless @address_list.nil?  
      end
      return nil unless self.id

      @address_list = GroupAddressList.new({:group_id => self.id})
      return @address_list
    end
    

    # The checkin information.
    #
    # @return [GroupCheckinList]
    def checkins(force_reload = false)
      unless force_reload
        return @checkin_list unless @checkin_list.nil?  
      end
      return nil unless self.id

      @checkin_list = GroupCheckinList.new({:group_id => self.id})
      return @checkin_list
    end


    # The checkin information.
    #
    # @return [GroupExportList]
    def exports(force_reload = false)
      unless force_reload
        return @export_list unless @export_list.nil?  
      end
      return nil unless self.id

      @export_list = GroupExportList.new({:group_id => self.id})
      return @export_list
    end  


    # The checkin information.
    #
    # @return [GroupEventAttendanceList]
    def event_attendances(force_reload = false)
      unless force_reload
        return @event_attendance_list unless @event_attendance_list.nil?  
      end
      return nil unless self.id

      @event_attendance_list = GroupEventAttendanceList.new({:group_id => self.id})
      return @event_attendance_list
    end    


    # The invitations for this group.
    #
    # @return [GroupInvitationList]
    def invitations(force_reload = false)
      unless force_reload
        return @invitation_list unless @invitation_list.nil?  
      end
      return nil unless self.id
 
      @invitation_list = GroupInvitationList.new({:group_id => self.id})
      return @invitation_list
    end


    # The roles for this group.
    #
    # @return [GroupRoleList]
    def roles(force_reload = false)
      unless force_reload
        return @role_list unless @role_list.nil?  
      end
      return nil unless self.id
 
      @role_list = GroupRoleList.new({:group_id => self.id})
      return @role_list
    end     


    # The tags for this group.
    #
    # @return [GroupTagList]
    def tags(force_reload = false)
      unless force_reload
        return @tag_list unless @tag_list.nil?  
      end
      return nil unless self.id
  
      @tag_list = GroupTagList.new({:group_id => self.id})
      return @tag_list
    end     

  end

end


