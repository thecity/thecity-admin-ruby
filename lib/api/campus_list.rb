module TheCity

  class CampusList < ApiList

    include Enumerable

    # Constructor.
    #
    # @param options A hash of options for loading the list.
    # 
    # Options:
    #   :page - The page number to get.
    #   :reader - The Reader to use to load the data.
    #   :search -  (optional) A campus name to search on.
    #
    #
    # Examples:
    #   CampusList.new
    #
    #   CampusList.new({:page => 2})
    #    
    def initialize(options = {}) 
      @options = options
      @options[:page] ||= 1
      @options[:reader] = TheCity::CampusListReader.new(@options) if @options[:reader].nil?
      @json_data = @options[:reader].load_feed 

      @total_entries = @json_data['total_entries']
      @total_pages = @json_data['total_pages']
      @per_page = @json_data['per_page']
      @current_page = @json_data['current_page']      
    end
    
    
    # All the campuss in the list.
    #
    # @return array of campus names.
    def all_names
      @json_data['campuses'].collect { |campus| campus['name'] }
    end
    alias :names :all_names
    
    
    # Get the specified campus.
    #
    # @param index The index of the campus to get.
    #
    # @return [Group]
    def [](index)
      Campus.new( @json_data['campuses'][index] ) if @json_data['campuses'][index]
    end


    # This method is needed for Enumerable.
    def each &block
      @json_data['campuses'].each{ |campus| yield( Campus.new(campus) )}
    end    


    # Alias the count method
    alias :size :count

    # Checks if the list is empty.
    #
    # @return True on empty, false otherwise.
    def empty?
      @json_data['campuses'].empty?
    end    
  
  end
  
end
