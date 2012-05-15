module TheCity

  class UserFamilyList 

    attr_reader :id, :created_at, :external_id

    # Constructor.
    #
    # @param FamilyListLoader loader The object that loaded the data.
    def initialize(loader)
      @json_data = loader.load_feed

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
    # @return FamilyMember
    def [](index)      
      UserFamilyMember.new( @json_data['family_members'][index] ) if @json_data['family_members'][index]
    end
  
  end
  
end
