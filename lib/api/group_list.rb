module TheCity

  class GroupList 

    include Enumerable

    attr_reader :total_entries, :total_pages, :per_page, :current_page


    # Constructor.
    #
    # @param options A hash of options for loading the list.
    # 
    # Options:
    #   :page - The page number to get.
    #   :reader - The Reader to use to load the data.
    #   :search -  (optional) A group name to search on.
    #
    #
    # Examples:
    #   UserList.new
    #
    #   UserList.new({:page => 2})
    #    
    def initialize(options = {}) 
      options[:page] ||= 1
      reader = options[:reader] || TheCity::GroupReader.new(options)   
      @json_data = reader.load_feed

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


    # Alias the count method
    alias :size :count

    # Checks if the list is empty.
    #
    # @return True on empty, false otherwise.
    def empty?
      @json_data['groups'].empty?
    end    
  
  end
  
end
