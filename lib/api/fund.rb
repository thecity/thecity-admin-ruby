module TheCity

  class Fund < ApiObject
    tc_attr_accessor :id,
                     :name,
                     :tax_deductible,
                     :group_id,
                     :fund_state,
                     :pledge_type,
                     :pledge_state,
                     :pledge_inactive_date,
                     :pledge_description,
                     :online_givable,
                     :external_id,
                     :created_at,
                     :updated_at

    # Loads the fund by the specified ID.
    #
    # @param fund_id The ID of the fund to load.
    #
    # Returns a new {Fund} object.
    def self.load_fund_by_id(fund_id)
      fund_reader = FundReader.new(fund_id)
      self.new(fund_reader)
    end       



    # Constructor.
    #
    # @param reader (optional) The object that has the data.  This can be a {FundReader} or Hash object.
    def initialize(reader = nil)
      if reader.is_a?(FundReader)
        initialize_from_json_object(reader.load_feed) 
      elsif reader.is_a?(Hash)
        initialize_from_json_object(reader)
      end
      @writer_object = FundWriter
    end

  end

end


