module TheCity

  # This class is the base class for all TheCity objects and is meant to be inherited.
  #
  class ApiList
    
    attr_reader :total_entries, :total_pages, :per_page, :current_page
    
    def self.load(options = {}) 
      @reader = nil
      self.new(options)
    end

    # Gets the next page of results.
    # 
    # @return [UserList] or nil if there are no more pages.
    def next_page
      return nil if @current_page == @total_pages
      self.class.new( @options.merge({:page => @options[:page]+1}) )
    end

    # Loads the next page of results and replaces self with the results.
    # 
    # @return true on success or otherwise false.
    def next_page!
      return false if @current_page == @total_pages

      @options[:page] += 1
      @options[:reader] = @options[:reader].class.new(@options)
      @json_data = @options[:reader].load_feed

      @total_entries = @json_data['total_entries']
      @total_pages = @json_data['total_pages']
      @per_page = @json_data['per_page']
      @current_page = @json_data['current_page'] 

      return true
    end    

  end

end


