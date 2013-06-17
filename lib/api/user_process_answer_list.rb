module TheCity

  class UserProcessAnswerList < ApiList

    include Enumerable

    # Constructor.
    #
    # @param options A hash of options for loading the list.
    #
    # Options:
    #   :user_id - The ID of the user to load the answers for the process. (required)
    #   :process_id - The ID of the user's process to load the answers for. (required)
    #   :page - The page number to get.
    #   :reader - The Reader to use to load the data.
    #
    #
    # Examples:
    #   UserProcessAnswerList.new({:user_id => 12345, :process_id => 23456})
    #
    #   UserProcessAnswerList.new({:user_id => 12345, :process_id => 23456, :page => 2})
    #
    def initialize(options = {})
      options[:page] ||= 1
      reader = options[:reader] || TheCity::UserProcessAnswerListReader.new(options)
      @json_data = reader.load_feed

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
      UserProcessAnswer.new( @json_data['answers'][index] ) if @json_data['answers'][index]
    end


    # This method is needed for Enumerable.
    def each &block
      @json_data['answers'].each{ |process| yield( UserProcessAnswer.new(process) )}
    end

    # Alias the count method
    alias :size :count

    # Checks if the list is empty.
    #
    # @return True on empty, false otherwise.
    def empty?
      @json_data['answers'].empty?
    end

  end

end
