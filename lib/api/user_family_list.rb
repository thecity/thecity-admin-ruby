module TheCity

  class UserFamilyList < ApiList

    include Enumerable

    attr_reader :id, :created_at, :external_id

    # Constructor.
    #
    # @param options A hash of options for loading the list.
    # 
    # Options:
    #   :user_id - The ID of the user to load the family members for. (required)
    #   :page - The page number to get.
    #   :reader - The Reader to use to load the data.
    #
    #
    # Examples:
    #   UserFamilyList.new({:user_id => 12345})
    #
    #   UserFamilyList.new({:user_id => 12345, :page => 2})
    #    
    def initialize(options = {}) 
      @options = options
      @options[:page] ||= 1
      @options[:reader] = TheCity::UserFamilyListReader.new(@options) if @options[:reader].nil?
      @json_data = @options[:reader].load_feed 

      @id = @json_data['id']
      @created_at = @json_data['created_at']
      @external_id = @json_data['external_id']
    end
    
    
    # All the famly member names in the list.
    #
    # @return array of names.
    def all_names
      @json_data['family_members'].collect { |user| user['name'] }
    end
    alias :names :all_names
    
    
    # Get the specified family member.
    #
    # @param index The index of the family member to get.
    #
    # @return [UserFamilyMember]
    def [](index)      
      UserFamilyMember.new( @json_data['family_members'][index] ) if @json_data['family_members'][index]
    end


    # This method is needed for Enumerable.
    def each &block
      @json_data['family_members'].each{ |member| yield( UserFamilyMember.new(member) )}
    end    
  
    # Alias the count method
    alias :size :count

    # Checks if the list is empty.
    #
    # @return True on empty, false otherwise.
    def empty?
      @json_data['family_members'].empty?
    end

  end
  
end
