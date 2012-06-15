module TheCity

  class MetricMeasurementList 

    include Enumerable

    attr_reader :total_entries, :total_pages, :per_page, :current_page

    # Constructor.
    #
    # @param [UserRoleListReader] reader The object that loaded the data.
    def initialize(reader) 
      @json_data = reader.load_feed

      @total_entries = @json_data['total_entries']
      @total_pages = @json_data['total_pages']
      @per_page = @json_data['per_page']
      @current_page = @json_data['current_page']      
    end
    
    
    # Get the specified user role.
    #
    # @param index The index of the user role to get.
    #
    # @return [UserRole]
    def [](index)
      MetricMeasurement.new( @json_data['measurements'][index] ) if @json_data['measurements'][index]
    end


    # This method is needed for Enumerable.
    def each &block
      @json_data['measurements'].each{ |measurement| yield( MatricMeasurement.new(measurement) )}
    end    
  
  end
  
end
