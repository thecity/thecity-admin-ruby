module TheCity

  class UserAdminPrivilegeList 

    include Enumerable

    attr_reader :total_entries, :total_pages, :per_page, :current_page

    # Constructor.
    #
    # @param [UserAdminPrivilegeListReader] reader The object that loaded the data.
    def initialize(reader) 
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
      UserAdminPrivilege.new( @json_data['acct_roles'][index] ) if @json_data['acct_roles'][index]
    end


    # This method is needed for Enumerable.
    def each &block
      @json_data['acct_roles'].each{ |acct_role| yield( UserAdminPrivilege.new(acct_role) )}
    end    
  
    # Alias the count method
    alias :size :count

    # Checks if the list is empty.
    #
    # @return True on empty, false otherwise.
    def empty?
      @json_data['acct_roles'].empty?
    end

  end
  
end
