module TheCity

  class GroupCheckin < ApiObject

    tc_attr_accessor :group,
                     :checked_out_by_user,
                     :special_instructions,
                     :parent_group_name,
                     :callboard_number,
                     :checked_in_at,
                     :barcode,
                     :checked_in_user,
                     :checked_in_user_id,
                     :id,
                     :checked_in_by_user,
                     :checked_in_by_user_id,
                     :parent_receipt_barcode,
                     :event,
                     :checked_in_user_notes,
                     :checked_out_at,
                     :parent_group_id,
                     :pager_number

    # Constructor.
    #
    # @param json_data JSON data of the group checkin.
    def initialize(json_data)
      initialize_from_json_object(json_data)
    end

    # Loads the group_checkin by the specified ID.
    #
    # @param group_id The ID of the group to load.
    # @param checkin_id The ID of the group_checkin to load.
    #
    # Returns a new {GroupCheckin} object.
    def self.load_by_id(group_id, checkin_id)
      reader = GroupCheckinReader.new(group_id, checkin_id, 'id')
      self.new(reader.load_feed)
    rescue
      nil
    end

    # Loads the group_checkin by the specified pager_number.
    #
    # @param group_id The ID of the group to load.
    # @param pager_number The pager_number of the group_checkin to load.
    #
    # Returns a new {GroupCheckin} object.
    def self.load_by_pager_number(group_id, pager_number)
      reader = GroupCheckinReader.new(group_id, pager_number, 'pager_number')
      self.new(reader.load_feed)
    rescue
      nil
    end

    # Loads the group_checkin by the specified callboard_number.
    #
    # @param group_id The ID of the group to load.
    # @param callboard_number The callboard_number of the group_checkin to load.
    #
    # Returns a new {GroupCheckin} object.
    def self.load_by_callboard_number(group_id, callboard_number)
      reader = GroupCheckinReader.new(group_id, callboard_number, 'callboard_number')
      self.new(reader.load_feed)
    rescue
      nil
    end
    
  end

end


