module TheCityAdmin

  class PledgeList < ApiList

    include Enumerable

    # Constructor.
    #
    # @param options A hash of options for loading the list.
    # 
    # Options:
    #   :page - The page number to get.
    #   :reader - The Reader to use to load the data.
    #   :search -  (optional) A pledge name to search on.
    #
    #
    # Examples:
    #   PledgeList.new
    #
    #   PledgeList.new({:page => 2})
    #    
    def initialize(options = {}) 
      @options = options
      @options[:page] ||= 1
      @options[:reader] = TheCityAdmin::PledgeListReader.new(@options) if @options[:reader].nil?
      @json_data = @options[:reader].load_feed 

      @total_entries = @json_data['total_entries']
      @total_pages = @json_data['total_pages']
      @per_page = @json_data['per_page']
      @current_page = @json_data['current_page']      
    end
    
    
    # All the pledges in the list.
    #
    # @return array of pledge names.
    def all_names
      @json_data['pledges'].collect { |pledge| pledge['user_name'] }
    end
    alias :names :all_names
    
    
    # Get the specified pledge.
    #
    # @param index The index of the pledge to get.
    #
    # @return [pledge]
    def [](index)
      Pledge.new( @json_data['pledges'][index] ) if @json_data['pledges'][index]
    end


    # This method is needed for Enumerable.
    def each &block
      @json_data['pledges'].each{ |pledge| yield( Pledge.new(pledge) )}
    end    


    # Alias the count method
    alias :size :count

    # Checks if the list is empty.
    #
    # @return True on empty, false otherwise.
    def empty?
      @json_data['pledges'].empty?
    end    
  
  end
  
end
