class UserListLoader < ApiLoader

  # Constructor.
  #
  # <b>subdomain</b> The church subdomain.
  # <b>num_per_page</b> The number of items to show.  Max is 15. Default is 10.
  # <b>CacheAdapter cacher</b> The cacher to be used to cache data.
  #/
  def initialize(page = 1, num_per_page = 10, cacher = nil) 
    @class_key = "topics_#{num_per_page}"   
    
    # The URL to load the topics from. 
    @url = "http://#{subdomain}.onthecity.org/plaza/topics.json?per_page=#{num_per_page}"

    # The object to store and load the cache.
    @cacher = cacher unless cacher.nil?    
  end


  # Loads all the topics on the Plaza for the subdomain.
  #
  # Returns the data loaded in a JSON object.
  def load_feed
    unless @cacher.nil? or @cacher.is_cache_expired?( @class_key )
      return @cacher.get_data( @class_key )
    end   

    json = open(@url).read
    data = JSON.parse(json)    

    @cacher.save_data(@class_key, data) unless @cacher.nil?      

    return data
  end 

end
