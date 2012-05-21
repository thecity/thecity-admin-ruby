module TheCity

  class UserAdminPrivilegeList 

    attr_reader :total_entries, :total_pages, :per_page, :current_page

    # Constructor.
    #
    # @param [UserAdminPrivilegeListLoader] loader The object that loaded the data.
    def initialize(loader) 
      @json_data = loader.load_feed

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
  
  end
  
end
