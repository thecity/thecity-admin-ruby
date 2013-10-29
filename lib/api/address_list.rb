module TheCityAdmin

  class AddressList < ApiList

    include Enumerable

    # Constructor.
    #
    # @param options A hash of options for loading the list.
    # 
    # Options:
    #   :page - The page number to get.
    #   :reader - The Reader to use to load the data.
    #
    #
    # Examples:
    #   AddressList.new
    #
    #   AddressList.new({:page => 2})
    #    
    def initialize(options = {}) 
      @options = options
      @options[:reader] = TheCityAdmin::AddressListReader.new(@options) if @options[:reader].nil?
      @json_data = @options[:reader].load_feed      

      @total_entries = @json_data['total_entries']
      @total_pages = @json_data['total_pages']
      @per_page = @json_data['per_page']
      @current_page = @json_data['current_page']      
    end
    
    
    # Get the specified note.
    #
    # @param index The index of the note to get.
    #
    # @return [Address]
    def [](index)
      Address.new( @json_data['addresses'][index] ) if @json_data['addresses'][index]
    end


    # This method is needed for Enumerable.
    def each &block
      @json_data['addresses'].each{ |address| yield( Address.new(address) )}
    end    
  
  
    # Alias the count method
    alias :size :count

    # Checks if the list is empty.
    #
    # @return True on empty, false otherwise.
    def empty?
      @json_data['addresses'].empty?
    end

  end
  
end
