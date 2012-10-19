module TheCity

  class InvitationList 

    include Enumerable

    attr_reader :total_entries, :total_pages, :per_page, :current_page

    # Constructor.
    #
    # @param options A hash of options for loading the list.
    # 
    # Options:
    #   :group_id - The ID of the group to load the roles for. (required)
    #   :page - The page number to get.
    #   :reader - The Reader to use to load the data.
    #
    #
    # Examples:
    #   InvitationList.new({:group_id => 12345})
    #
    #   InvitationList.new({:group_id => 12345, :page => 2})
    #    
    def initialize(options = {}) 
      reader = options[:reader] || TheCity::InvitationListReader.new(options)  
      @json_data = reader.load_feed

      @total_entries = @json_data['total_entries']
      @total_pages = @json_data['total_pages']
      @per_page = @json_data['per_page']
      @current_page = @json_data['current_page']      
    end
    
    
    # Get the specified group invitation.
    #
    # @param index The index of the group invitation to get.
    #
    # @return [Invitation]
    def [](index)
      Invitation.new( @json_data['invitations'][index] ) if @json_data['invitations'][index]
    end


    # This method is needed for Enumerable.
    def each &block
      @json_data['invitations'].each{ |invitation| yield( Invitation.new(invitation) )}
    end    
  
    # Alias the count method
    alias :size :count

    # Checks if the list is empty.
    #
    # @return True on empty, false otherwise.
    def empty?
      @json_data['invitations'].empty?
    end

  end
  
end
