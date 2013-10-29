module TheCityAdmin

  class MetricMeasurementList < ApiList

    include Enumerable

    # Constructor.
    #
    # @param options A hash of options for loading the list.
    # 
    # Options:
    #   :metric_id - The ID of the metric to load the measurements for. (required)
    #   :page - The page number to get.
    #   :reader - The Reader to use to load the data.
    #
    #
    # Examples:
    #   MetricMeasurementList.new({:metric_id => 12345})
    #
    #   MetricMeasurementList.new({:metric_id => 12345, :page => 2})
    #    
    def initialize(options = {}) 
      @options = options
      @options[:page] ||= 1
      @options[:reader] = TheCityAdmin::MetricMeasurementListReader.new(@options) if @options[:reader].nil?
      @json_data = @options[:reader].load_feed 

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
      @json_data['measurements'].each{ |measurement| yield( MetricMeasurement.new(measurement) )}
    end    
  
    # Alias the count method
    alias :size :count

    # Checks if the list is empty.
    #
    # @return True on empty, false otherwise.
    def empty?
      @json_data['measurements'].empty?
    end

  end
  
end
