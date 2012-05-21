module TheCity

  class UserList 

    attr_reader :total_entries, :total_pages, :per_page, :current_page

    # Constructor.
    #
    # @param [UserListLoader] loader The object that loaded the data.
    # @param options A hash of filters for loading the user list.
    # 
    # Options:
    #   :page - The page number to get
    #   :created_within - A string specifying the period of time to look back for users created.
    #   :contact_updated_within - A string specifying the period of time to look back for users created.
    def initialize(loader, options = {}) 
      @json_data = loader.load_feed(options)

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
    # @return [User]
    def [](index)  
      User.new( @json_data['users'][index] ) if @json_data['users'][index]
    end
  
  end
  
end
