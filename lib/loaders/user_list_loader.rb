class UserListLoader < ApiLoader

  attr_reader :total_entries, :total_pages, :per_page, :current_page

  # Constructor.
  #
  # <b>page</b> The page number to get.  Default is 1.
  # <b>per_page</b> The number of items to show.  Default is 10.
  # <b>CacheAdapter cacher</b> The cacher to be used to cache data.
  #/
  def initialize(page = 1, per_page = 10, cacher = nil) 
    # defaults
    @total_entries = 0
    @total_pages = 0
    @per_page = 0
    @current_page = 0

    @class_key = "users_list_#{page}_#{per_page}"   
    
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

    json = TheCity::AdminApi.typhoeus_request(:get, '/users')
    data = JSON.parse(json)    

    @cacher.save_data(@class_key, data) unless @cacher.nil?      

    return data
  end 

end
