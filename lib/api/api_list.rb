module TheCity

  # This class is the base class for all TheCity objects and is meant to be inherited.
  #
  class ApiList
    
    attr_reader :total_entries, :total_pages, :per_page, :current_page
    
    def self.load(options = {}) 
      self.new(options)
    end

    # Gets the next page of results.
    # 
    # @return [UserList] or nil if there are no more pages.
    def next_page
      return nil if @current_page == @total_pages
      self.new( @options.merge({:page => @options[:page]+1}) )
    end

  end

end


