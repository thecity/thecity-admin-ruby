module TheCity

  class GroupCheckinEvent < ApiObject

    tc_attr_accessor :ending_at,
                     :group_id,
                     :group_name,
                     :id,
                     :starting_at,
                     :title,
                     :shadow_event_ids

    # Constructor.
    #
    # @param json_data JSON data of the group checkin event.
    def initialize(json_data)
      initialize_from_json_object(json_data)
    end

  end

end


