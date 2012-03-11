
module NulloObject
  class Nullo < BasicObject

    # FIXME determine whether create a singleton instance for the nil case.. perhaps no because it accepts another param besides the object

    def initialize(parent_object, string_when_nil='')
      @parent_object = parent_object
      # FIXME perhaps this variable should not be here
      @string_when_nil = string_when_nil
    end

    # FIXME definte methos if_nil(), with the parameter to return when it's nil (string_with_nil)

    # FIXME method for returning the parent object

    def nil?
      @parent_object.nil?
    end

    def blank?
      @parent_object.blank?
    end

    def to_s
      if @parent_object.nil?
        @string_when_nil
      else
        @parent_object.to_s
      end
    end

    def _nullo
      @parent_object
    end

    def if_nil(string_when_nil='')
      if @parent_object.nil?
        string_when_nil
      else
        @parent_object.to_s
      end
    end

    def method_missing(method, *args, &block)
      #::Kernel::puts "#{@parent_object} - #{method}"
      if @parent_object.nil?
        ::NulloObject::Nullo.new(nil, @string_when_nil)
      else
        ::NulloObject::Nullo.new(@parent_object.send(method, *args, &block), @string_when_nil)
      end
    end
  end
end
