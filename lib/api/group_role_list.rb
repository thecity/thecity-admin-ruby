module TheCity

  class GroupRoleList 

    attr_reader :total_entries, :total_pages, :per_page, :current_page

    # Constructor.
    #
    # @param GroupRoleListLoader loader The object that loaded the data.
    def initialize(loader) 
      @json_data = loader.load_feed

      @total_entries = @json_data['total_entries']
      @total_pages = @json_data['total_pages']
      @per_page = @json_data['per_page']
      @current_page = @json_data['current_page']      
    end
    
    
    # Get the specified group role.
    #
    # @param index The index of the group role to get.
    #
    # @return GroupRole
    def [](index)
      GroupRole.new( @json_data['roles'][index] ) if @json_data['roles'][index]
    end
  
  end
  
end
