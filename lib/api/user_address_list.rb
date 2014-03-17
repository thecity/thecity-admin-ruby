module TheCityAdmin

  class UserAddressList < ApiList

    include Enumerable

    # Constructor.
    #
    # @param options A hash of options for loading the list.
    # 
    # Options:
    #   :user_id - The ID of the user to load the addresses for. (required)
    #   :page - The page number to get.
    #   :reader - The Reader to use to load the data.
    #
    #
    # Examples:
    #   UserAddressList.new({:user_id => 12345})
    #
    #   UserAddressList.new({:user_id => 12345, :page => 2})
    #    
    def initialize(options = {}) 
      @options = options
      @options[:reader] = TheCityAdmin::UserAddressListReader.new(@options) if @options[:reader].nil?
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
    # @return [UserAddress]
    def [](index)
      UserAddress.new( @json_data['addresses'][index] ) if @json_data['addresses'][index]
    end


    # This method is needed for Enumerable.
    def each &block
      @json_data['addresses'].each{ |address| yield( UserAddress.new(address) )}
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
