module TheCity

  class UserInvitationList 

    include Enumerable

    attr_reader :total_entries, :total_pages, :per_page, :current_page

    # Constructor.
    #
    # @param [UserInvitationListReader] reader The object that loaded the data.
    def initialize(reader) 
      @json_data = reader.load_feed

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
  
  end
  
end
