module TheCity

  class ApiObject

    def self.tc_attr_accessor(*vars)
      @__tc_attributes ||= []
      @__tc_attributes.concat(vars)
      attr_accessor(*vars)
    end

    def self.__tc_attributes
      @__tc_attributes
    end



    def initialize_from_json_object(object_attributes)
      if object_attributes.is_a?( Hash )
        object_attributes.each { |key, value| self.send("#{key.downcase.gsub(' ', '_')}=", value) }
      end     
    end
    


    def to_json 
      jvals = {}
      self.class.__tc_attributes.each { |tca| jvals[tca] = self.send(tca) }
      jvals
    end

  end

end


