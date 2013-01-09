module TheCity

  class DonationExport < ApiObject

    tc_attr_accessor :id, 
                     :state,
                     :authenticated_s3_url,
                     :created_at


    # Loads the donation export by the specified ID.
    #
    # @param donation_export_id The ID of the donation export to load.
    # @param options A hash of options for requesting data from the server.
    #                :: donation_id is required    
    #
    # Returns a new {DonationExport} object.
    def self.load_by_id(donation_export_id, options = {})
      donation_reader = DonationExportReader.new(donation_export_id, options)
      self.new(donation_reader.load_feed)
    rescue
      nil        
    end     


    # Constructor.
    #
    # @param json_data (optional) JSON data of the donation export.
    def initialize(json_data = nil)
      @writer_object = DonationExportWriter
      initialize_from_json_object(json_data) unless json_data.nil?
    end
    
  end

end


