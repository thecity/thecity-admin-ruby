module TheCity

  class GroupEventAttendance < ApiObject

    tc_attr_accessor :user,
                     :created_at,
                     :event_title,
                     :event_id,
                     :updated_at,
                     :tracked_by,
                     :id,
                     :user_id,
                     :attended_on,
                     :tracked_by_user_id,
                     :checkin_id

    # Constructor.
    #
    # @param json_data JSON data of the group checkin.
    def initialize(json_data)
      initialize_from_json_object(json_data)
    end
    
  end

end


