$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'rspec'
require 'kompress'

# Requires supporting files with custom matchers and macros, etc,
# in ./support/ and its subdirectories.
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}


BIG_CSS = <<-CSS
.TS-controls a:hover {
  background-color:#fff;
}
.TS-notch_active {
  -webkit-box-shadow: 0px 0px 10px #333; 
  -moz-box-shadow: 0px 0px 10px #333; 
  box-shadow: 0px 0px 10px #333;
  
  /* let's throw IE7 users a bone */
  *border: 1px solid #333;
}
.TS-zoom {
  background-repeat:no-repeat;
  background-position:center center;
  width:20px !important;
  padding:3px 8px 3px 8px !important;
  margin-right:4px;
}
.TS-zoom_inner_text {
  display:none;
  /* IE7 */
  *display:inline;
}
.TS-series_legend_item_inactive {}
.TS-series_legend_item_inactive .TS-series_legend_swatch {
  background-image:none !important;
  filter:alpha(opacity=40); /* IE can't do data URLs, so this will serve as 'inactive' UI for series heds in IE */
}
CSS

small_css = <<-CSS
.TS-controls a:hover{background-color:#fff;}.TS-notch_active{-webkit-box-shadow: 0px 0px 10px #333;-moz-box-shadow: 0px 0px 10px #333;box-shadow: 0px 0px 10px #333;*border: 1px solid #333;}.TS-zoom {background-repeat:no-repeat;background-position:center center;width:20px !important;padding:3px 8px 3px 8px !important;margin-right:4px;}.TS-zoom_inner_text{display:none;*display:inline;}.TS-series_legend_item_inactive {}.TS-series_legend_item_inactive .TS-series_legend_swatch{background-image:none !important;filter:alpha(opacity=40);}
CSS

SMALL_CSS = small_css.strip


RSpec.configure do |config|
  
end
