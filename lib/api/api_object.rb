module TheCity

  class ApiObject

    def load_data(object_attributes)
      if object_attributes.is_a?( Hash )
        object_attributes.each { |key, value| self.send("#{key.downcase.gsub(' ', '_')}=", value) }
      end
    end
    
  end

end


