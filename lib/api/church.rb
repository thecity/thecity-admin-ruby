module TheCityAdmin

  class Church < ApiObject

    tc_attr_accessor :id,
                     :name

    # Constructor.
    def initialize
      reader = TheCityAdmin::ChurchReader.new 
      json_data = reader.load_feed
      initialize_from_json_object(json_data)
    end
    
  end

end

