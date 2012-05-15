module TheCity

  class GroupTagList 

    attr_reader :total_entries, :total_pages, :per_page, :current_page

    # Constructor.
    #
    # @param GroupTagListLoader loader The object that loaded the data.
    def initialize(loader) 
      @json_data = loader.load_feed

      @total_entries = @json_data['total_entries']
      @total_pages = @json_data['total_pages']
      @per_page = @json_data['per_page']
      @current_page = @json_data['current_page']      
    end
    
    
    # Get the specified group tag.
    #
    # @param index The index of the group tag to get.
    #
    # @return GroupTag
    def [](index)
      GroupTag.new( @json_data['tags'][index] ) if @json_data['tags'][index]
    end
  
  end
  
end
