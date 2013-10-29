module TheCityAdmin

  class UserList < ApiList

    include Enumerable

    # Constructor.
    #
    # @param options A hash of options for loading the list.
    # 
    # Options:
    #   :page - The page number to get.
    #   :reader - The Reader to use to load the data.
    #
    #
    # Examples:
    #   UserList.new
    #
    #   UserList.new({:page => 2})
    #    
    def initialize(options = {}) 
      @options = options.clone
      @options[:page] ||= 1
      @options[:per_page] ||= 200
      @options[:reader] = TheCity::UserListReader.new(@options) if @options[:reader].nil?
      @json_data = @options[:reader].load_feed 

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
  
    # Alias the count method
    alias :size :count

    # Checks if the list is empty.
    #
    # @return True on empty, false otherwise.
    def empty?
      @json_data['users'].empty?
    end   
  
  end
  
end
