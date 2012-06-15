module TheCity

  class UserNoteList 

    include Enumerable

    attr_reader :total_entries, :total_pages, :per_page, :current_page

    # Constructor.
    #
    # @param [UserNoteListReader] reader The object that loaded the data.
    def initialize(reader) 
      @json_data = reader.load_feed

      @total_entries = @json_data['total_entries']
      @total_pages = @json_data['total_pages']
      @per_page = @json_data['per_page']
      @current_page = @json_data['current_page']      
    end
    
    
    # Get the specified note.
    #
    # @param index The index of the note to get.
    #
    # @return [UserNote]
    def [](index)
      UserNote.new( @json_data['notes'][index] ) if @json_data['notes'][index]
    end


    # This method is needed for Enumerable.
    def each &block
      @json_data['notes'].each{ |note| yield( UserNote.new(note) )}
    end    
  
  end
  
end
