require './lib/nullo-object'

describe "nullo" do

  context "when object is nil" do
    instance = nil

    it "should respond true to nil?" do
      expect(instance.nullo).to be_nil
    end

    it "it should return x for nil objects, if if_nil(x) is passed" do
      expect(instance.nullo.if_nil(420)).to eq(420)
    end

  end

  context "when object is not nil" do
    instance = 'test string'

    it "should be chainable" do
      expect(instance.nullo.upcase.downcase.if_nil('')).to eq('test string')
    end

    it "should be chainable when one of the methods return nil" do
      expect(instance.nullo.upcase.upcase!.downcase).to be_nil
    end

    it "should ignore if_nil" do
      expect(instance.nullo.upcase.if_nil('derp')).to eq('TEST STRING')
    end
  end

end
