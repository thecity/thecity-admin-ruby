module TheCityAdmin

  class Pledge < ApiObject
    tc_attr_accessor :id, 
                     :user_id, 
                     :fund_id, 
                     :amount, 
                     :pledge_date, 
                     :created_at, 
                     :updated_at,
                     :fund_name,
                     :primary_campus_id,
                     :user_name,
                     :user_type,
                     :user_api_url,
                     :user_is_member,
                     :spouse_id,
                     :spouse_name,
                     :spouse_is_name


    # Loads the pledge by the specified ID.
    #
    # @param pledge_id The ID of the pledge to load.
    #
    # Returns a new {Pledge} object.
    def self.load_pledge_by_id(pledge_id)
      pledge_reader = PledgeReader.new(Pledge_id)
      self.new(pledge_reader)
    end       



    # Constructor.
    #
    # @param reader (optional) The object that has the data.  This can be a {PledgeReader} or Hash object.
    def initialize(reader = nil)
      if reader.is_a?(PledgeReader)
        initialize_from_json_object(reader.load_feed) 
      elsif reader.is_a?(Hash)
        initialize_from_json_object(reader)
      end
    end

  end

end


