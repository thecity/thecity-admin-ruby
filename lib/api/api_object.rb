module TheCity

  # This class is the base class for all TheCity objects and is meant to be inherited.
  #
  class ApiObject

    # Used to specify a list of getters and setters.
    def self.tc_attr_accessor(*vars)
      @__tc_attributes ||= []
      @__tc_attributes.concat(vars)
      attr_accessor(*vars)
    end


    # A list of tc_attr_accessors that have been specified.
    def self.__tc_attributes
      @__tc_attributes
    end


    # Initializes the current object from the JSON data that was loaded into the Hash
    #
    # @param object_attributes A Hash of values to load into the current object.
    def initialize_from_json_object(object_attributes)
      if object_attributes.is_a?( Hash )
        object_attributes.each do |key, value| 
          method_to_call = "#{key.to_s.downcase.gsub(' ', '_')}="
          if respond_to?(method_to_call)
            self.send(method_to_call, value) 
          else
            # puts method_to_call  # Show the missing methods
          end
        end
      end     
    end
    

    # Gets the current object's attributes in a Hash.
    #
    # @return A hash of all the attributes.
    def to_attributes 
      vals = {}
      self.class.__tc_attributes.each { |tca| vals[tca] = self.send(tca) }
      vals
    end

  end

end


