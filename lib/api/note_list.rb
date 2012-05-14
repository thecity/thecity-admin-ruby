module TheCity

  class NoteList 

    attr_reader :total_entries, :total_pages, :per_page, :current_page

    # Constructor.
    #
    # @param NoteListLoader loader The object that loaded the data.
    def initialize(loader) 
      @json_data = loader.load_feed

      @total_entries = @json_data['total_entries']
      @total_pages = @json_data['total_pages']
      @per_page = @json_data['per_page']
      @current_page = @json_data['current_page']      
    end
    
    
    # Get the specified note.
    #
    # @param index The index of the note to get.
    #
    # @return Note
    def [](index)
      Note.new( @json_data['notes'][index] ) if @json_data['notes'][index]
    end
  
  end
  
end
