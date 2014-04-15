module TheCity

  class CheckinListByPagerNumber < ApiList

    include Enumerable

    # Constructor.
    #
    # @param pager_number The pager number to filter by
    # @param options A hash of options for loading the list.
    #
    # Options:
    #   :page - The page number to get.
    #   :reader - The Reader to use to load the data.
    #
    #
    # Examples:
    #   CheckinListByPagerNumber.new('111')
    #
    #   CheckinListByPagerNumber.new('111', {:page => 2})
    #
    def initialize(pager_number, options = {})
      @options = options
      @options[:reader] = TheCity::CheckinListByPagerNumberReader.new(pager_number, @options) if @options[:reader].nil?
      @json_data = @options[:reader].load_feed

      @total_entries = @json_data['total_entries']
      @total_pages = @json_data['total_pages']
      @per_page = @json_data['per_page']
      @current_page = @json_data['current_page']
    end

    # Get the specified note.
    #
    # @param index The index of the checkin to get.
    #
    # @return [Checkin]
    def [](index)
      Checkin.new( @json_data['checkins'][index] ) if @json_data['checkins'][index]
    end


    # This method is needed for Enumerable.
    def each &block
      @json_data['checkins'].each{ |checkin| yield( Checkin.new(checkin) )}
    end


    # Alias the count method
    alias :size :count

    # Checks if the list is empty.
    #
    # @return True on empty, false otherwise.
    def empty?
      @json_data['checkins'].empty?
    end

  end

end
