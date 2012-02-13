require './nullo'

describe "nullo" do

  context "general" do

    it "shoud return the same object when xxx is called" do

    end

  end

  context "when object is nil" do
    let(:instance) { Nullo.new(nil) }

    it "nil? should be true" do
      instance.nil?.should == true
    end

  end

  context "when object is a String" do
    let(:instance) { Nullo.new('Test String') }
    it "should be chainable" do
      instance.upcase.downcase.should == 'test string'
    end
    it "should be chainable when one of the methods return nil" do
      # the method upcase! returns nil
      instance.upcase.upcase!.downcase.should == nil
    end
  end

end