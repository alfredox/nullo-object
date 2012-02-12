

class Nullo < BasicObject
  
  #attr_accessor :parent_object
  
  def initialize(parent_object, string_when_nil='')
    @parent_object = parent_object
    @string_when_nil = string_when_nil
  end
  
  def to_s
    if @parent_object.nil?
      @string_when_nil
    else
      @parent_object.to_s
    end
  end
  
  def method_missing(method, *args, &block)
    #::Kernel::puts "#{method}"
    if @parent_object.nil?
      ::Nullo.new(nil, @string_when_nil)
    else
      ::Nullo.new(@parent_object.send(method, *args, &block), @string_when_nil)
    end
  end
end