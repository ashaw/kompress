require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Kompress" do
  %w[css html].each do |lang|
    it "should compress #{lang}" do
      k = Kompress.const_get("#{lang.upcase}").new(Kernel.const_get("BIG_#{lang.upcase}"))
      k.send(lang).should eql Kernel.const_get("SMALL_#{lang.upcase}")
    end
  end
end
