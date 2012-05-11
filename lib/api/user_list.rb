module TheCity

  class UserList 

    # Constructor.
    #
    # @param loader The object that loaded the data.
    def initialize(loader) 
      super
      @total_entries = loader.total_entries
      @total_pages = loader.total_pages
      @per_page = loader.per_page
      @current_page = loader.current_page

      @json_data = loader.load_feed
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
