module TheCity

  # This adapter is the standard for all loading objects.
  class ApiLoader

    # Constructor
    def initialize()
    end

    # Loads the data.
    #
    # Returns true on success or a string error message on false.
    def load_feed
      raise 'The load_feed method must be implemented'
    end

  end

end