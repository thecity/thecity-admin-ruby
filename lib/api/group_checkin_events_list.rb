module TheCity

  class GroupCheckinEventsList < ApiList

    include Enumerable

    # Constructor.
    #
    # @param options A hash of options for loading the list.
    #
    # Options:
    #   :group_id - The ID of the group to load the checkin events for. (required)
    #   :page - The page number to get.
    #   :reader - The Reader to use to load the data.
    #
    #
    # Examples:
    #   GroupCheckinEventsList.new({:group_id => 12345})
    #
    #   GroupCheckinEventsList.new({:group_id => 12345, :page => 2})
    #
    def initialize(options = {})
      @options = options
      @options[:reader] = TheCity::GroupCheckinEventsListReader.new(@options) if @options[:reader].nil?
      @json_data = @options[:reader].load_feed

      @total_entries = @json_data['total_entries']
      @total_pages = @json_data['total_pages']
      @per_page = @json_data['per_page']
      @current_page = @json_data['current_page']
    end


    # Get the specified note.
    #
    # @param index The index of the checkin event to get.
    #
    # @return [GroupCheckinEvent]
    def [](index)
      GroupCheckinEvent.new( @json_data['checkin_events'][index] ) if @json_data['checkin_events'][index]
    end


    # This method is needed for Enumerable.
    def each &block
      @json_data['checkin_events'].each{ |checkin| yield( GroupCheckinEvent.new(checkin) )}
    end


    # Alias the count method
    alias :size :count

    # Checks if the list is empty.
    #
    # @return True on empty, false otherwise.
    def empty?
      @json_data['checkin_events'].empty?
    end

  end

end
