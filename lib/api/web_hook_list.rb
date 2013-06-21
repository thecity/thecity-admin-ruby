module TheCity

  class WebHookList < ApiList

    include Enumerable

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
    #   WebHookListReader.new
    #
    #   UserSkillList.new({:page => 2})
    #    
    def initialize(options = {}) 
      @options = options
      @options[:page] ||= 1
      reader = @options[:reader] || TheCity::WebHookListReader.new(options)  
      @json_data = reader.load_feed

      @total_entries = @json_data['total_entries']
      @total_pages = @json_data['total_pages']
      @per_page = @json_data['per_page']
      @current_page = @json_data['current_page']      
    end
    

    # All the web_hooks in the list.
    #
    # @return array of web_hook names.
    def all_web_hooks
      return [] if @json_data['web_hooks'].nil?
      @json_data['web_hooks'].collect { |web_hook| [web_hook['object'], web_hook['event']].join('::') }
    end
    alias :web_hooks :all_web_hooks
        
    
    # Get the specified web hook.
    #
    # @param index The index of the web hook to get.
    #
    # @return [WebHook]
    def [](index)
      WebHook.new( @json_data['web_hooks'][index] ) if @json_data['web_hooks'][index]
    end


    # This method is needed for Enumerable.
    #
    # @return [WebHook]
    def each &block
      @json_data['web_hooks'].each{ |web_hook| yield( WebHook.new(web_hook) ) }
    end    
  
    # Alias the count method
    alias :size :count

    # Checks if the list is empty.
    #
    # @return True on empty, false otherwise.
    def empty?
      @json_data['web_hooks'].empty?
    end
  
  end
  
end
