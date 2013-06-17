module TheCity

  class SkilledUserList < ApiList

    include Enumerable

    # Constructor.
    #
    # @param options A hash of options for loading the list.
    # 
    # Options:
    #   :skill_id - The skill ID to load the user for. (Required)
    #   :page - The page number to get.
    #
    #
    # Examples:
    #   SkilledUserList.new
    #
    #   SkilledUserList.new({:page => 2})
    #    
    def initialize(options = {}) 
      options[:page] ||= 1
      reader = options[:reader] || TheCity::SkilledUserListReader.new(options)
      @json_data = reader.load_feed

      @total_entries = @json_data['total_entries']
      @total_pages = @json_data['total_pages']
      @per_page = @json_data['per_page']
      @current_page = @json_data['current_page']      
    end
    
    
    # All the users in the list.
    #
    # @return array of skill names.
    def all_users
      return [] if @json_data['users'].nil?
      @json_data['users'].collect { |user| [user['first'], user['last']].join(' ') }
    end
    alias :users :all_users
    
    
    # Get the specified skill.
    #
    # @param index The index of the skill to get.
    #
    # @return [User]
    def [](index)
      User.new( @json_data['users'][index] ) if @json_data['users'][index]
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
