module TheCity

  class DonationList < ApiList

    include Enumerable

    # Constructor.
    #
    # @param options A hash of options for loading the list.
    # 
    # Options:
    #   :page - The page number to get.
    #   :reader - The Reader to use to load the data.
    #   :search -  (optional) A donation name to search on.
    #
    #
    # Examples:
    #   DonationList.new
    #
    #   DonationList.new({:page => 2})
    #    
    def initialize(options = {}) 
      @options = options
      @options[:page] ||= 1
      reader = @options[:reader] || TheCity::DonationListReader.new(options)   
      @json_data = reader.load_feed

      @total_entries = @json_data['total_entries']
      @total_pages = @json_data['total_pages']
      @per_page = @json_data['per_page']
      @current_page = @json_data['current_page']      
    end
    
    
    # All the donations in the list.
    #
    # @return array of donation names.
    def all_names
      @json_data['donations'].collect { |donation| donation['user_name'] }
    end
    alias :names :all_names
    
    
    # Get the specified donation.
    #
    # @param index The index of the donation to get.
    #
    # @return [donation]
    def [](index)
      Donation.new( @json_data['donations'][index] ) if @json_data['donations'][index]
    end


    # This method is needed for Enumerable.
    def each &block
      @json_data['donations'].each{ |donation| yield( Donation.new(donation) )}
    end    


    # Alias the count method
    alias :size :count

    # Checks if the list is empty.
    #
    # @return True on empty, false otherwise.
    def empty?
      @json_data['donations'].empty?
    end    
  
  end
  
end
