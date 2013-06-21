module TheCity

  class FundList < ApiList

    include Enumerable

    # Constructor.
    #
    # @param options A hash of options for loading the list.
    # 
    # Options:
    #   :page - The page number to get.
    #   :reader - The Reader to use to load the data.
    #   :search -  (optional) A fund name to search on.
    #
    #
    # Examples:
    #   FundList.new
    #
    #   FundList.new({:page => 2})
    #    
    def initialize(options = {}) 
      @options = options
      @options[:page] ||= 1
      @options[:reader] = TheCity::FundListReader.new(@options) if @options[:reader].nil?
      @json_data = @options[:reader].load_feed 

      @total_entries = @json_data['total_entries']
      @total_pages = @json_data['total_pages']
      @per_page = @json_data['per_page']
      @current_page = @json_data['current_page']      
    end
    
    
    # All the funds in the list.
    #
    # @return array of fund names.
    def all_names
      @json_data['funds'].collect { |fund| fund['user_name'] }
    end
    alias :names :all_names
    
    
    # Get the specified fund.
    #
    # @param index The index of the fund to get.
    #
    # @return [fund]
    def [](index)
      Fund.new( @json_data['funds'][index] ) if @json_data['funds'][index]
    end


    # This method is needed for Enumerable.
    def each &block
      @json_data['funds'].each{ |fund| yield( Fund.new(fund) )}
    end    


    # Alias the count method
    alias :size :count

    # Checks if the list is empty.
    #
    # @return True on empty, false otherwise.
    def empty?
      @json_data['funds'].empty?
    end    
  
  end
  
end
