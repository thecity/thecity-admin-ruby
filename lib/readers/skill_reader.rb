module TheCityAdmin

  class SkillReader < ApiReader

    # Constructor.
    #
    # <b>skill_id</b> The ID of the skill to load.
    # <b>CacheAdapter cacher</b> (optional) The cacher to be used to cache data.
    def initialize(skill_id, cacher = nil)
      #@class_key = "funds_#{fund_id}"   
      @url_data_path = "/skills/#{skill_id}"
      
      # The object to store and load the cache.
      @cacher = cacher unless cacher.nil?    
    end
    
  end

end


