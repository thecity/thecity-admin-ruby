module TheCity

  class SkillList < ApiList

    include Enumerable

    # Constructor.
    #
    # @param options A hash of options for loading the skill list.
    # 
    # Options:
    #   :page - The page number to get.
    #   :reader - The Reader to use to load the data.
    #
    #
    # Examples:
    #   SkillList.new
    #
    #   SkillList.new({:page => 2})
    #    
    def initialize(options = {}) 
      @options = options
      @options[:page] ||= 1
      reader = @options[:reader] || TheCity::SkillListReader.new(options)
      @json_data = reader.load_feed

      @total_entries = @json_data['total_entries']
      @total_pages = @json_data['total_pages']
      @per_page = @json_data['per_page']
      @current_page = @json_data['current_page']      
    end
    
    
    # All the skills in the list.
    #
    # @return array of skill names.
    def all_skills
      return [] if @json_data['skills'].nil?
      @json_data['skills'].collect { |skill| skill['name'] }
    end
    alias :skills :all_skills
    
    
    # Get the specified skill.
    #
    # @param index The index of the skill to get.
    #
    # @return [Skill]
    def [](index)
      Skill.new( @json_data['skills'][index] ) if @json_data['skills'][index]
    end


    # This method is needed for Enumerable.
    def each &block
      @json_data['skills'].each{ |skill| yield( Skill.new(skill) )}
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
