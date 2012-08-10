module TheCity

  class UserSkillList 

    include Enumerable

    attr_reader :total_entries, :total_pages, :per_page, :current_page

    # Constructor.
    #
    # @param options A hash of options for loading the list.
    # 
    # Options:
    #   :user_id - The ID of the user to load the user skills for. (required)
    #   :page - The page number to get.
    #   :reader - The Reader to use to load the data.
    #
    #
    # Examples:
    #   UserSkillList.new({:user_id => 12345})
    #
    #   UserSkillList.new({:user_id => 12345, :page => 2})
    #    
    def initialize(options = {}) 
      options[:page] ||= 1
      reader = options[:reader] || TheCity::UserSkillListReader.new(options)  
      @json_data = reader.load_feed

      @user_id = options[:user_id] || nil
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
    # @return [UserSkill]
    def [](index)
      UserSkill.new( @json_data['skills'][index].merge({:user_id => @user_id}) ) if @json_data['skills'][index]
    end


    # This method is needed for Enumerable.
    def each &block
      @json_data['skills'].each{ |skill| yield( UserSkill.new(skill.merge({:user_id => @user_id})) ) }
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
