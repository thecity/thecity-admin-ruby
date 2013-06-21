module TheCity

  class GroupCheckinList < ApiList

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
    #   GroupCheckinList.new({:group_id => 12345})
    #
    #   GroupCheckinList.new({:group_id => 12345, :page => 2})
    #    
    def initialize(options = {}) 
      @options = options
      reader = @options[:reader] || TheCity::GroupCheckinListReader.new(options)    
      @json_data = reader.load_feed

      @total_entries = @json_data['total_entries']
      @total_pages = @json_data['total_pages']
      @per_page = @json_data['per_page']
      @current_page = @json_data['current_page']      
    end
    
    
    # Get the specified note.
    #
    # @param index The index of the note to get.
    #
    # @return [GroupCheckin]
    def [](index)
      GroupCheckin.new( @json_data['checkins'][index] ) if @json_data['checkins'][index]
    end


    # This method is needed for Enumerable.
    def each &block
      @json_data['checkins'].each{ |checkin| yield( GroupCheckin.new(checkin) )}
    end    
  
  
    # Alias the count method
    alias :size :count

    # Checks if the list is empty.
    #
    # @return True on empty, false otherwise.
    def empty?
      @json_data['checkins'].empty?
    end

  end
  
end
