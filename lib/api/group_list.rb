module TheCity

  class GroupList 

    include Enumerable

    attr_reader :total_entries, :total_pages, :per_page, :current_page

    # Constructor.
    #
    # @param [UserListLoader] loader The object that loaded the data.
    # @param options A hash of filters for loading the user list.
    # 
    # Options:
    #   :page - The page number to get.
    #   :search -  (optional) A group name to search on.
    #
    #
    # Examples:
    #   GroupList.new(loader, {:page => 3, :search => 'Bobby Grossi'})
    #
    #   GroupList.new(loader, {:page => 2, :search => 'Pub and Sub'})
    #    
    def initialize(loader, options = {}) 
      @json_data = loader.load_feed

      @total_entries = @json_data['total_entries']
      @total_pages = @json_data['total_pages']
      @per_page = @json_data['per_page']
      @current_page = @json_data['current_page']      
    end
    
    
    # All the groups in the list.
    #
    # @return array of group names.
    def all_names
      @json_data['groups'].collect { |group| group['name'] }
    end
    alias :names :all_names
    
    
    # Get the specified group.
    #
    # @param index The index of the group to get.
    #
    # @return [Group]
    def [](index)
      Group.new( @json_data['groups'][index] ) if @json_data['groups'][index]
    end


    # This method is needed for Enumerable.
    def each &block
      @json_data['groups'].each{ |group| yield( Group.new(group) )}
    end    
  
  end
  
end
