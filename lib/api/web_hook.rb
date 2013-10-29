module TheCityAdmin

  class WebHook < ApiObject

    tc_attr_accessor :id,
                     :callback_uri, 
                     :event,
                     :object

    Objects = {:user => 'user', :group => 'group', :invitation => 'invitation',
               :privilege => 'privilege', :checkin => 'checkin', :address => 'address',
               :group_tag => 'group_tag', :fund => 'fund', :pledge => 'pledge', :donation => 'donation'}

    Events = {:create => 'create', :update => 'update', :destroy => 'destroy', :expire => 'expire'}              

    # Constructor.
    #
    # @param json_data (optional) JSON data of the web hook.
    def initialize(json_data = nil)
      @writer_object = WebHookWriter
      initialize_from_json_object(json_data) unless json_data.nil?
    end


    # The name of the hook based on the event and object
    def name
      "#{self.object}::#{self.event}"
    end
    
  end

end


