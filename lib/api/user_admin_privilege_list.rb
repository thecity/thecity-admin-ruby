module TheCity

  class UserAdminPrivilegeList < ApiList

    include Enumerable

    # Constructor.
    #
    # @param options A hash of options for loading the list.
    # 
    # Options:
    #   :user_id - The ID of the user to load the admin privileges for. (required)
    #   :page - The page number to get.
    #   :reader - The Reader to use to load the data.
    #
    #
    # Examples:
    #   UserAdminPrivilegeList.new({:user_id => 12345})
    #
    #   UserAdminPrivilegeList.new({:user_id => 12345, :page => 2})
    #    
    def initialize(options = {}) 
      options[:page] ||= 1
      reader = options[:reader] || TheCity::UserAdminPrivilegeListReader.new(options)
      @json_data = reader.load_feed

      @total_entries = @json_data['total_entries']
      @total_pages = @json_data['total_pages']
      @per_page = @json_data['per_page']
      @current_page = @json_data['current_page']      
    end
    
    
    # Get the specified account admin privilege.
    #
    # @param index The index of the admin privilege to get.
    #
    # @return [UserAdminPrivilege]
    def [](index)
      UserAdminPrivilege.new( @json_data['account_roles'][index] ) if @json_data['account_roles'][index]
    end


    # This method is needed for Enumerable.
    def each &block
      @json_data['account_roles'].each{ |account_role| yield( UserAdminPrivilege.new(account_role) )}
    end    
  
    # Alias the count method
    alias :size :count

    # Checks if the list is empty.
    #
    # @return True on empty, false otherwise.
    def empty?
      @json_data['account_roles'].empty?
    end

  end
  
end
