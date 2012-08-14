module TheCity

  class TerminologyList 

    include Enumerable

    attr_reader :total_entries, :total_pages, :per_page, :current_page

    # Constructor.
    #
    # @param options A hash of options for loading the list.
    # 
    # Options:
    #   :page - The page number to get.
    #   :reader - The Reader to use to load the data.
    #
    #
    # Examples:
    #   TerminologyList.new
    #
    #   TerminologyList.new({:page => 2})
    #    
    def initialize(options = {}) 
      options[:page] ||= 1
      reader = options[:reader] || TheCity::TerminologyListReader.new(options)
      @json_data = reader.load_feed

      @total_entries = @json_data['total_entries']
      @total_pages = @json_data['total_pages']
      @per_page = @json_data['per_page']
      @current_page = @json_data['current_page']      
    end
    
    
    # All the terms in the list.
    #
    # @return array of term names.
    def all_tags
      return [] if @json_data['labels'].nil?
      @json_data['labels'].collect { |label| label.values[0] }
    end
    alias :tags :all_tags
    
    
    # Get the specified tag.
    #
    # @param index The index of the tag to get.
    #
    # @return [Tag]
    def [](index)
      Terminology.new( @json_data['labels'][index] ) if @json_data['labels'][index]
    end


    # This method is needed for Enumerable.
    def each &block
      @json_data['labels'].each{ |tag| yield( Terminology.new(tag) )}
    end    


    # Alias the count method
    alias :size :count

    # Checks if the list is empty.
    #
    # @return True on empty, false otherwise.
    def empty?
      @json_data['labels'].empty?
    end    
  
  end
  
end
