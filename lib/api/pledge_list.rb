module TheCity

  class PledgeList 

    include Enumerable

    attr_reader :total_entries, :total_pages, :per_page, :current_page


    # Constructor.
    #
    # @param options A hash of options for loading the list.
    # 
    # Options:
    #   :page - The page number to get.
    #   :reader - The Reader to use to load the data.
    #   :search -  (optional) A pledge name to search on.
    #
    #
    # Examples:
    #   UserList.new
    #
    #   UserList.new({:page => 2})
    #    
    def initialize(options = {}) 
      options[:page] ||= 1
      reader = options[:reader] || TheCity::PledgeListReader.new(options)   
      @json_data = reader.load_feed

      @total_entries = @json_data['total_entries']
      @total_pages = @json_data['total_pages']
      @per_page = @json_data['per_page']
      @current_page = @json_data['current_page']      
    end
    
    
    # All the pledges in the list.
    #
    # @return array of pledge names.
    def all_names
      @json_data['pledges'].collect { |pledge| pledge['id'] }
    end
    alias :names :all_names
    
    
    # Get the specified pledge.
    #
    # @param index The index of the pledge to get.
    #
    # @return [pledge]
    def [](index)
      pledge.new( @json_data['pledges'][index] ) if @json_data['pledges'][index]
    end


    # This method is needed for Enumerable.
    def each &block
      @json_data['pledges'].each{ |pledge| yield( Pledge.new(pledge) )}
    end    


    # Alias the count method
    alias :size :count

    # Checks if the list is empty.
    #
    # @return True on empty, false otherwise.
    def empty?
      @json_data['pledges'].empty?
    end    
  
  end
  
end
