module TheCity

  class GroupAddressList < ApiList

    include Enumerable

    # Constructor.
    #
    # @param options A hash of options for loading the list.
    # 
    # Options:
    #   :group_id - The ID of the group to load the addresses for. (required)
    #   :page - The page number to get.
    #   :reader - The Reader to use to load the data.
    #
    #
    # Examples:
    #   GroupAddressList.new({:group_id => 12345})
    #
    #   GroupAddressList.new({:group_id => 12345, :page => 2})
    #    
    def initialize(options = {}) 
      @options = options
      @options[:reader] = TheCity::GroupAddressListReader.new(@options) if @options[:reader].nil?
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
    # @return [GroupAddress]
    def [](index)
      GroupAddress.new( @json_data['addresses'][index] ) if @json_data['addresses'][index]
    end


    # This method is needed for Enumerable.
    def each &block
      @json_data['addresses'].each{ |address| yield( GroupAddress.new(address) )}
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
