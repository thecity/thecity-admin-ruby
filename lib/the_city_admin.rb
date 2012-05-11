# This class is meant to be a wrapper TheCity Admin API (OnTheCity.org).
module TheCity

  class AdminApi

    attr_reader :api_key, :api_token

    # Constructor.
    #
    # <b>api_key</b> The API key for the church.
    # <b>api_token</b> The API token for the church.
    def initialize(api_key, api_token)
      # Create a constant for the churches API key.
      TheCity::AdminApi::const_set(:API_KEY, api_key)

      # Create a constant for the churches API Token.
      TheCity::AdminApi::const_set(:API_TOKEN, api_token)

      # User list usage variables
      @users_page_requested = 0
      @users_per_page_requested = 0    
      @user_list = nil
    end


    # Shows all the topics posted on the Plaza.
    # <b>page</b> The page number to get.  Default 1.
    # <b>per_page</b> The number of items to show.  Default 20.
    # <b>options</b>
    #
    # Returns array of users for the specified.
    def users(page = 1, per_page = 20, options = {})
      return @user_list if @users_page_requested == page and @users_per_page_requested == per_page and !@user_list.nil?  
      @users_page_requested = page
      @users_per_page_requested = per_page
      loader = UserListLoader.new(page, per_page)    
      @user_list = UserList.new( loader );
      return @user_list
    end  

  end

end
