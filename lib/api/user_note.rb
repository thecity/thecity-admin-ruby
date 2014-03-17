module TheCityAdmin

  class UserNote < ApiObject

    VisibleTo = {:api_admin => "API Admin", :account_admin => "Account Admin", 
                 :designer => "Designer", :financial_user => "Financial User",
                 :group_admin => "Group Admin", :process_user => "Process User", 
                 :reporting_user => "Reporting User", :resource_admin => "Resource Admin",
                 :support_admin => "Support Admin", :user_admin => "User Admin"}

    tc_attr_accessor :author, 
                     :author_id, 
                     :body,
                     :created_at, 
                     :id, 
                     :updated_at, 
                     :visible_to                 

    # Constructor.
    #
    # @param json_data (optional) JSON data of the note.
    def initialize(json_data = nil)
      @writer_object = UserNoteWriter
      initialize_from_json_object(json_data)
    end
    
  end

end


