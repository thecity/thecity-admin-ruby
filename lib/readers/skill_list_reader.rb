module TheCity

  class SkillListReader < ApiReader

    # Constructor.
    #
    # @param page The page number to get.  Default is 1.
    # @param options A hash of options for requesting data from the server.
    # @param [CacheAdapter] cacher (optional) The cacher to be used to cache data.
    def initialize(page = 1, options = {}, cacher = nil) 
      search = options[:search] || ''

      @class_key = "skill_list_#{page}_#{search.to_s.downcase.gsub(' ','')}"   
      @url_data_path = "/skills"
      @url_data_params = {:page => page}
      
      # The object to store and load the cache.
      @cacher = cacher unless cacher.nil?    
    end

  end

end
