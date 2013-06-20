module TheCity

  class Donation < ApiObject
    tc_attr_accessor :split_id,
                     :external_id,
                     :amount,
                     :id,
                     :date,
                     :note,
                     :instrument,
                     :state,
                     :batch_id,
                     :user,
                     :fund
    
    # tc_attr_accessor :id, 
    #                  :user_id, 
    #                  :fund_id, 
    #                  :batch_id,
    #                  :amount, 
    #                  :instrument_type, 
    #                  :donation_state, 
    #                  :donation_date, 
    #                  :created_at, 
    #                  :updated_at,
    #                  :fund_name,
    #                  :primary_campus_id,
    #                  :user_name,
    #                  :user_type,
    #                  :user_api_url,
    #                  :user_is_member,
    #                  :spouse_id,
    #                  :spouse_name,
    #                  :spouse_is_member

    # Loads the donation by the specified ID.
    #
    # @param donation_id The ID of the donation to load.
    #
    # Returns a new {Donation} object.
    def self.load_donation_by_id(pledge_id)
      donation_reader = DonationReader.new(Pledge_id)
      self.new(donation_reader)
    end       



    # Constructor.
    #
    # @param reader (optional) The object that has the data.  This can be a {DonationReader} or Hash object.
    def initialize(reader = nil)
      if reader.is_a?(DonationReader)
        initialize_from_json_object(reader.load_feed) 
      elsif reader.is_a?(Hash)
        initialize_from_json_object(reader)
      end
    end

    # Convert amount to cents.
    #
    # @return Amount in cents.
    def amount_cents 
      (self.amount.to_f * 100).round.to_i
    end
  end

end


