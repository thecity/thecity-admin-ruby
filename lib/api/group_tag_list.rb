module TheCity

  class GroupTagList 

    include Enumerable

    attr_reader :total_entries, :total_pages, :per_page, :current_page

    # Constructor.
    #
    # @param options A hash of options for loading the list.
    # 
    # Options:
    #   :group_id - The ID of the group to load the roles for. (required)
    #   :page - The page number to get.
    #   :reader - The Reader to use to load the data.
    #
    #
    # Examples:
    #   GroupTagList.new({:group_id => 12345})
    #
    #   GroupTagList.new({:group_id => 12345, :page => 2})
    #    
    def initialize(options = {}) 
      reader = options[:reader] || TheCity::GroupTagListReader.new(options)  
      @json_data = reader.load_feed

      @total_entries = @json_data['total_entries']
      @total_pages = @json_data['total_pages']
      @per_page = @json_data['per_page']
      @current_page = @json_data['current_page']      
    end
    
    
    # Get the specified group tag.
    #
    # @param index The index of the group tag to get.
    #
    # @return [GroupTag]
    def [](index)
      GroupTag.new( @json_data['tags'][index] ) if @json_data['tags'][index]
    end


    # This method is needed for Enumerable.
    def each &block
      @json_data['tags'].each{ |tag| yield( GroupTag.new(tag) )}
    end    
  
    # Alias the count method
    alias :size :count

    # Checks if the list is empty.
    #
    # @return True on empty, false otherwise.
    def empty?
      @json_data['tags'].empty?
    end

  end
  
end
