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

  end

end


