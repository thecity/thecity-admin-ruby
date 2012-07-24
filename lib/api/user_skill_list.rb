module TheCity

  class UserSkillList 

    include Enumerable

    attr_reader :total_entries, :total_pages, :per_page, :current_page

    # Constructor.
    #
    # @param [UserSkillListReader] reader The object that loaded the data.
    def initialize(reader) 
      @json_data = reader.load_feed

      @total_entries = @json_data['total_entries']
      @total_pages = @json_data['total_pages']
      @per_page = @json_data['per_page']
      @current_page = @json_data['current_page']      
    end
    
    
    # Get the specified skill.
    #
    # @param index The index of the skill to get.
    #
    # @return [UserSkill]
    def [](index)
      UserSkill.new( @json_data['skills'][index] ) if @json_data['skills'][index]
    end


    # This method is needed for Enumerable.
    def each &block
      @json_data['skills'].each{ |skill| yield( UserSkill.new(skill) )}
    end    
  
    # Alias the count method
    alias :size :count

    # Checks if the list is empty.
    #
    # @return True on empty, false otherwise.
    def empty?
      @json_data['skills'].empty?
    end
  
  end
  
end
