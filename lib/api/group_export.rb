module TheCity

  class GroupExport < ApiObject

    tc_attr_accessor :id, 
                     :group_id,
                     :state,
                     :authenticated_s3_url,
                     :created_at


    # Loads the group export by the specified ID.
    #
    # @param group_export_id The ID of the group export to load.
    # @param options A hash of options for requesting data from the server.
    #                :: group_id is required    
    #
    # Returns a new {GroupExport} object.
    def self.load_by_id(group_export_id, options = {})
      group_reader = GroupExportReader.new(group_export_id, options)
      self.new(group_reader.load_feed)
    rescue
      nil        
    end     


    # Constructor.
    #
    # @param json_data (optional) JSON data of the group export.
    def initialize(json_data = nil)
      @writer_object = GroupExportWriter
      initialize_from_json_object(json_data) unless json_data.nil?
    end
    
  end

end


