module TheCity

  class UserRoleList < ApiList

    include Enumerable

    # Constructor.
    #
    # @param options A hash of options for loading the list.
    # 
    # Options:
    #   :user_id - The ID of the user to load the roles for. (required)
    #   :page - The page number to get.
    #   :reader - The Reader to use to load the data.
    #
    #
    # Examples:
    #   UserRoleList.new({:user_id => 12345})
    #
    #   UserRoleList.new({:user_id => 12345, :page => 2})
    #    
    def initialize(options = {}) 
      options[:page] ||= 1
      reader = options[:reader] || TheCity::UserRoleListReader.new(options)  
      @json_data = reader.load_feed

      @user_id = options[:user_id] || nil
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
        
    
    # Get the specified user role.
    #
    # @param index The index of the user role to get.
    #
    # @return [UserRole]
    def [](index)
      UserRole.new( @json_data['roles'][index].merge({:user_id => @user_id}) ) if @json_data['roles'][index]
    end


    # This method is needed for Enumerable.
    def each &block
      @json_data['roles'].each{ |role| yield( UserRole.new(role.merge({:user_id => @user_id})) )}
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
