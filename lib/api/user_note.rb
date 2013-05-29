module TheCity

  class UserNote < ApiObject

    VisibleTo = {:api_admin => "API Admin", :account_admin => "Account Admin", 
                 :designer => "Designer", :financial_user => "Financial User",
                 :group_admin => "Group Admin", :process_user => "Process User", 
                 :reporting_user => "Reporting User", :resource_admin => "Resource Admin",
                 :support_admin => "Support Admin", :user_admin => "User Admin"}

    tc_attr_accessor :created_at, 
                     :body,
                     :author, 
                     :updated_at, 
                     :id, 
                     :visible_to,
                     :author_id, 
                     :file_attachments                

    # Constructor.
    #
    # @param json_data (optional) JSON data of the note.
    def initialize(json_data = nil)
      @writer_object = UserNoteWriter
      initialize_from_json_object(json_data)
    end
    
  end

end


