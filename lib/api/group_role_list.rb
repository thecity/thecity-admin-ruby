module TheCity

  class GroupRoleList < ApiList

    include Enumerable    

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
    #   GroupRoleList.new({:group_id => 12345})
    #
    #   GroupRoleList.new({:group_id => 12345, :page => 2})
    #    
    def initialize(options = {}) 
      reader = options[:reader] || TheCity::GroupRoleListReader.new(options)  
      @json_data = reader.load_feed

      @total_entries = @json_data['total_entries']
      @total_pages = @json_data['total_pages']
      @per_page = @json_data['per_page']
      @current_page = @json_data['current_page']      
    end
    
    
    # Get the specified group role.
    #
    # @param index The index of the group role to get.
    #
    # @return [GroupRole]
    def [](index)
      GroupRole.new( @json_data['roles'][index] ) if @json_data['roles'][index]
    end


    # This method is needed for Enumerable.
    def each &block
      @json_data['roles'].each{ |role| yield( GroupRole.new(role) )}
    end    
  
    # Alias the count method
    alias :size :count

    # Checks if the list is empty.
    #
    # @return True on empty, false otherwise.
    def empty?
      @json_data['roles'].empty?
    end

  end
  
end
