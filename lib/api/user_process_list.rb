module TheCity

  class UserProcessList < ApiList

    include Enumerable

    # Constructor.
    #
    # @param options A hash of options for loading the list.
    # 
    # Options:
    #   :user_id - The ID of the user to load the user processes for. (required)
    #   :page - The page number to get.
    #   :reader - The Reader to use to load the data.
    #
    #
    # Examples:
    #   UserProcessList.new({:user_id => 12345})
    #
    #   UserProcessList.new({:user_id => 12345, :page => 2})
    #    
    def initialize(options = {}) 
      @options = options
      @options[:page] ||= 1
      @options[:reader] = TheCity::UserProcessListReader.new(@options) if @options[:reader].nil?
      @json_data = @options[:reader].load_feed 

      @total_entries = @json_data['total_entries']
      @total_pages = @json_data['total_pages']
      @per_page = @json_data['per_page']
      @current_page = @json_data['current_page']      
    end
    
    
    # Get the specified processes.
    #
    # @param index The index of the process to get.
    #
    # @return [UserProcesses]
    def [](index)   
      UserProcess.new( @json_data['processes'][index] ) if @json_data['processes'][index]
    end


    # This method is needed for Enumerable.
    def each &block
      @json_data['processes'].each{ |process| yield( UserProcess.new(process) )}
    end    
  
    # Alias the count method
    alias :size :count

    # Checks if the list is empty.
    #
    # @return True on empty, false otherwise.
    def empty?
      @json_data['processes'].empty?
    end

  end
  
end
