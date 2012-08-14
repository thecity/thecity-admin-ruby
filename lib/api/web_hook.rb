module TheCity

  class WebHook < ApiObject

    Objects = {:user => 'User', :group => 'Group', :invitation => 'Invitation',
               :privilege => 'Privilege', :checkin => 'Checkin', :address => 'Address'}

    Events = {:create => 'create', :update => 'update', :destroy => 'destroy', :expire => 'expire'}              


    tc_attr_accessor :id,
                     :callback_uri, 
                     :event,
                     :object

    # Constructor.
    #
    # @param json_data (optional) JSON data of the web hook.
    def initialize(json_data = nil)
      @writer_object = WebHookWriter
      initialize_from_json_object(json_data) unless json_data.nil?
    end
    
  end

end


