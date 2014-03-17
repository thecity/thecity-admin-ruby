module TheCityAdmin

  class UserCount < ApiObject

    tc_attr_accessor :count, 
                     :filter


    # Constructor.
    #
    # @param options A hash of options for loading the user count.
    # 
    # Options:
    #   :filter - The Reader to use to load the data.
    #
    #
    # Examples:
    #   UserCount.new
    #
    #   UserCount.new({:filter => :created_in_the_last_7_Days})
    #    
    def initialize(options = {})
      reader = options[:reader] || TheCityAdmin::UserCountReader.new(options)
      @json_data = reader.load_feed    
      self.count = @json_data['count']
      self.filter = @json_data['filter']
    end

    def save
      raise 'User count does not have a save method'
    end
    
    def delete
      raise 'User count does not have a delete method'
    end
  end

end


