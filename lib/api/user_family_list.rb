module TheCity

  class UserFamilyList 

    include Enumerable

    attr_reader :id, :created_at, :external_id

    # Constructor.
    #
    # @param [FamilyListReader] reader The object that loaded the data.
    def initialize(reader)
      @json_data = reader.load_feed

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
  
  end
  
end
