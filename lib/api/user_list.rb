module TheCity

  class UserList 

    attr_reader :total_entries, :total_pages, :per_page, :current_page

    # Constructor.
    #
    # @param UserListLoader loader The object that loaded the data.
    def initialize(loader) 
      @json_data = loader.load_feed

      @total_entries = @json_data['total_entries']
      @total_pages = @json_data['total_pages']
      @per_page = @json_data['per_page']
      @current_page = @json_data['current_page']      
    end
    
    
    # All the users in the list.
    #
    # @return array of names (first last).
    def all_names
      @json_data['users'].collect { |user| [user['first'], user['last']].join(' ') }
    end
    alias :names :all_names
    
    
    # Get the specified user.
    #
    # @param index The index of the user to get.
    #
    # @return User
    def [](index)  
      User.new( @json_data['users'][index] ) if @json_data['users'][index]
    end
  
  end
  
end
