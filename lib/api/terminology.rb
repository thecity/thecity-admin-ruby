module TheCity

  class Terminology < ApiObject

    tc_attr_accessor :term,
                     :label


    # Loads the terminology by the specified term.
    #
    # @param term The term of the Terminology to load.
    #
    # Returns a new {Terminology} object.
    def self.load_by_term(term)
      reader = TerminologyReader.new(term)
      self.new(reader.load_feed)
    rescue
      nil
    end       

    # Constructor.
    #
    # @param json_data JSON data of the Terminology.
    def initialize(json_data)
      @writer_object = TerminologyWriter
      self.term = json_data.keys[0]
      self.label = json_data.values[0]
    end

  end

end
