require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Kompress CSS" do
  it "should compress css" do
    k = Kompress::CSS.new(BIG_CSS)
    k.css.should eql SMALL_CSS
  end
end
