module TheCity

  class UserList 

    include Enumerable

    attr_reader :total_entries, :total_pages, :per_page, :current_page

    # Constructor.
    #
    # @param [UserListReader] reader The object that loaded the data.
    # @param options A hash of filters for loading the user list.
    # 
    # Options:
    #   :page - The page number to get.
    #   :filter -  (optional) The filters are below and only one can be specified.
    #     ::created_in_the_last_N_PERIOD - A string specifying the period of time to look back for users created. 
    #                                      N_PERIOD is in days, weeks, months or years.
    #     ::contact_updated_in_the_last_N_PERIOD - A string specifying the period of time to look back for users created.
    #                                              N_PERIOD is in days, weeks, months or years.
    #     ::with_external_id_1 - The external ID to reference.
    #     ::with_external_id_2 - The external ID to reference.
    #     ::with_external_id_3 - The external ID to reference.
    #     ::without_external_id_1 - The external ID to reference.
    #     ::without_external_id_2 - The external ID to reference.
    #     ::without_external_id_3 - The external ID to reference.
    #
    #
    # Examples:
    #   UserList.new(reader, {:page => 3, :filter => :created_in_the_last_7_days})
    #
    #   UserList.new(reader, {:page => 2, :filter => :contact_updated_in_the_last_2_weeks})
    #
    def initialize(reader, options = {}) 
      @json_data = reader.load_feed

      @total_entries = @json_data['total_entries']
      @total_pages = @json_data['total_pages']
      @per_page = @json_data['per_page']
      @current_page = @json_data['current_page'] 
    end
    
    
    # All the users in the list.
    #
    # @return array of names (first last).
    def all_names
      return [] unless @json_data['users']
      @json_data['users'].collect { |user| [user['first'], user['last']].join(' ') }
    end
    alias :names :all_names
    
    
    # Get the specified user.
    #
    # @param index The index of the user to get.
    #
    # @return [User]
    def [](index)  
      User.new( @json_data['users'][index] ) if @json_data['users'] and @json_data['users'][index]
    end


    # This method is needed for Enumerable.
    def each &block
      @json_data['users'].each{ |user| yield( User.new(user) )}
    end    
  
  end
  
end
