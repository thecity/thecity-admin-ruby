module TheCityAdmin

  class MetricMeasurementValues < ApiObject

  	include Enumerable

    tc_attr_accessor :values

    # Loads the metric measurement values by the specified metric ID.
    #
    # @param metric_id The ID of the user to load.
    #
    # Returns a new {Metric} object.
    def self.load_by_id(metric_id)
      metric_reader = MetricReader.new(metric_id)
      self.new(metric_reader.load_feed)
    end   


    # Constructor.
    #
    # @param options A hash of options for loading the list.
    # 
    # Options:
    #   :metric_id - The ID of the metric to load the measurements values for. (required)
    #   :reader - The Reader to use to load the data.
    #
    #
    # Examples:
    #   MetricMeasurementValues.new({:metric_id => 12345})
    #    
    def initialize(options = {})
      options[:reader] = TheCity::MetricMeasurementValuesReader.new(options) if options[:reader].nil?
      @json_data = options[:reader].load_feed 
    end
    
    # Get the specified account admin privilege.
    #
    # @param index The index of the admin privilege to get.
    #
    # @return Number
    def [](index)
      @json_data['values'][index] if @json_data['values'][index]
    end


    # This method is needed for Enumerable.
    def each &block
      @json_data['values'].each{ |value| yield(value) }
    end    
  
    # Alias the count method
    alias :size :count

    # Checks if the list is empty.
    #
    # @return True on empty, false otherwise.
    def empty?
      @json_data['values'].empty?
    end

  end

end

