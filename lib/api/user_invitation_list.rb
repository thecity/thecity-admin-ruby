module TheCity

  class UserInvitationList < ApiList

    include Enumerable

    # Constructor.
    #
    # @param options A hash of options for loading the list.
    # 
    # Options:
    #   :user_id - The ID of the user to load the user invitations for. (required)
    #   :page - The page number to get.
    #   :reader - The Reader to use to load the data.
    #
    #
    # Examples:
    #   UserInvitationList.new({:user_id => 12345})
    #
    #   UserInvitationList.new({:user_id => 12345, :page => 2})
    #    
    def initialize(options = {}) 
      @options = options
      @options[:page] ||= 1
      @options[:reader] = TheCity::UserInvitationListReader.new(@options) if @options[:reader].nil?
      @json_data = @options[:reader].load_feed 

      @total_entries = @json_data['total_entries']
      @total_pages = @json_data['total_pages']
      @per_page = @json_data['per_page']
      @current_page = @json_data['current_page']      
    end
    
    
    # Get the specified invitation.
    #
    # @param index The index of the invitation to get.
    #
    # @return [UserInvitation]
    def [](index)
      UserInvitation.new( @json_data['invitations'][index] ) if @json_data['invitations'][index]
    end


    # This method is needed for Enumerable.
    def each &block
      @json_data['invitations'].each{ |invitation| yield( UserInvitation.new(invitation) )}
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
