module NulloObject
  class Nullo < BasicObject

    def initialize parent_object
      @parent_object = parent_object
    end

    def _nullo
      @parent_object
    end

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

    def if_nil(value_when_nil = nil)
      if @parent_object.nil?
        value_when_nil
      else
        @parent_object
      end
    end

    def method_missing(method, *args, &block)
      if @parent_object.nil?
        ::NulloObject::Nullo.new nil
      else
        ::NulloObject::Nullo.new(@parent_object.send(method, *args, &block))
      end
    end
  end
end

# Object monkey-patch
class Object
  def nullo
    NulloObject::Nullo.new self
  end
end
