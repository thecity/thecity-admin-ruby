module TheCityAdmin

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
    
  end

end


