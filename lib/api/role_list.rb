module TheCity

  class RoleList 

    include Enumerable

    attr_reader :total_entries, :total_pages, :per_page, :current_page

    # Constructor.
    #
    # @param [UserListReader] reader The object that loaded the data.
    # @param options A hash of filters for loading the user list.
    # 
    # Options:
    #   :page - The page number to get.
    #   :options -  (optional) other parameters.
    #
    #
    # Examples:
    #   RoleList.new(reader, {:page => 3})
    #
    #   RoleList.new(reader, {:page => 2})
    #    
    def initialize(reader, options = {}) 
      @json_data = reader.load_feed

      @total_entries = @json_data['total_entries']
      @total_pages = @json_data['total_pages']
      @per_page = @json_data['per_page']
      @current_page = @json_data['current_page']      
    end
    
    
    # All the roles in the list.
    #
    # @return array of role names.
    def all_roles
      return [] if @json_data['roles'].nil?
      @json_data['roles'].collect { |role| role['title'] }
    end
    alias :roles :all_roles
    
    
    # Get the specified role.
    #
    # @param index The index of the role to get.
    #
    # @return [Role]
    def [](index)
      Role.new( @json_data['roles'][index] ) if @json_data['roles'][index]
    end


    # This method is needed for Enumerable.
    def each &block
      @json_data['roles'].each{ |role| yield( Role.new(role) )}
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
