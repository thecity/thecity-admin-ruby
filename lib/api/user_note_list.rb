module TheCityAdmin

  class UserNoteList < ApiList

    include Enumerable

    # Constructor.
    #
    # @param options A hash of options for loading the list.
    # 
    # Options:
    #   :user_id - The ID of the user to load the notes for. (required)
    #   :page - The page number to get.
    #   :reader - The Reader to use to load the data.
    #
    #
    # Examples:
    #   UserNoteList.new({:user_id => 12345})
    #
    #   UserNoteList.new({:user_id => 12345, :page => 2})
    #    
    def initialize(options = {}) 
      @options = options
      @options[:page] ||= 1
      @options[:reader] = TheCityAdmin::UserNoteListReader.new(@options) if @options[:reader].nil?
      @json_data = @options[:reader].load_feed 

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
  
    # Alias the count method
    alias :size :count

    # Checks if the list is empty.
    #
    # @return True on empty, false otherwise.
    def empty?
      @json_data['notes'].empty?
    end

  end
  
end
