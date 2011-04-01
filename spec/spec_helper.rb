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

.TS-controls a {
  border:1px solid #cecece;
  background-color:#f0f0f0;
  padding:3px 5px 3px 5px;
  color:#999;
  font-family:"Helvetica Neue",Arial,sans-serif;
  font-weight:normal;
  height: 14px;
  font-size:14px;
  -webkit-border-radius: 2px;
  -moz-border-radius: 2px;
  border-radius: 2px;      
  display: inline;
}
CSS

small_css = <<-CSS
.TS-controls a:hover{background-color:#fff;}.TS-notch_active{-webkit-box-shadow:0px 0px 10px #333;-moz-box-shadow:0px 0px 10px #333;box-shadow:0px 0px 10px #333;*border:1px solid #333;}.TS-zoom{background-repeat:no-repeat;background-position:center center;width:20px !important;padding:3px 8px 3px 8px !important;margin-right:4px;}.TS-zoom_inner_text{display:none;*display:inline;}.TS-series_legend_item_inactive{}.TS-series_legend_item_inactive .TS-series_legend_swatch{background-image:none !important;filter:alpha(opacity=40);}.TS-controls a{border:1px solid #cecece;background-color:#f0f0f0;padding:3px 5px 3px 5px;color:#999;font-family:"Helvetica Neue",Arial,sans-serif;font-weight:normal;height:14px;font-size:14px;-webkit-border-radius:2px;-moz-border-radius:2px;border-radius:2px;display:inline;}
CSS

SMALL_CSS = small_css.strip

BIG_HTML = <<-HTML
<div id="banner"> 
	<div class="wrapper"> 
		<div id="banner-identity"> 
                        <h1 id="banner-logo"><a href="/" class="pngfix">ProPublica</a></h1> 
            			<p id="banner-tagline">Journalism in the public interest.</p> 
		</div> 
		<div id="banner-updates"> 
			<form method="get" action="http://org2.democracyinaction.org/dia/api/process.jsp"> 
				<input type="hidden" name="table" value="supporter"> 
				<input type="hidden" name="key" value="0"> 
				<input type="hidden" name="required" value="Email"> 
				<input type="hidden" name="link" value="groups"> 
				<input type="hidden" name="linkKey" value="90412"> 
				<input type="hidden" name="redirect" value="http://www.propublica.org/about/thank-you"> 
				<input type="hidden" name="Receive_Email" value="3">  
				<input type="hidden" name="organization_KEY" value="6253"> 
				<input type="hidden" name="email_trigger_KEYS" value="8405"> 
				<p>Receive our top stories daily</p> 
				<div class="form-row text-row"> 
					<input type="text" class="text-input" id="subscribe-email" value="Subscribe via e-mail" name="Email" /> 
					<input type="submit" value="Sign Up" class="btn-input" /> 
				</div> 
				<div class="form-row text-row"> 
					 <input type="text" class="text-input" id="subscribe-zip" value="zip-code" name="Zip" /> <span>optional</span> 
				</div> 
			</form> 
		 </div><!-- /#banner-updates --> 
	</div><!--/.wrapper--> 
</div><!--#banner--> 
<div id="banner-nav"> 
    <!--[if IE]>
	  <link rel="stylesheet" href="http://www.propublica.org/css/ie.css?1301677503" type="text/css" media="screen" charset="utf-8" />
	<![endif]--> 
    <!--[if IE 7]>
	  <link rel="stylesheet" href="http://www.propublica.org/css/ie7.css?1301677503" type="text/css" media="screen" charset="utf-8" />
      <!--[if IE]>
  	  <link rel="stylesheet" href="http://www.propublica.org/css/ie.css?1301677503" type="text/css" media="screen" charset="utf-8" />
  	<![endif]--> 
      <!--[if IE 7]>
  	  <link rel="stylesheet" href="http://www.propublica.org/css/ie7.css?1301677503" type="text/css" media="screen" charset="utf-8" />
  	<![endif]--> 
HTML

small_html = <<-HTML
<div id="banner"><div class="wrapper"><div id="banner-identity"><h1 id="banner-logo"><a href="/" class="pngfix">ProPublica</a></h1><p id="banner-tagline">Journalism in the public interest.</p></div><div id="banner-updates"><form method="get" action="http://org2.democracyinaction.org/dia/api/process.jsp"><input type="hidden" name="table" value="supporter"><input type="hidden" name="key" value="0"><input type="hidden" name="required" value="Email"><input type="hidden" name="link" value="groups"><input type="hidden" name="linkKey" value="90412"><input type="hidden" name="redirect" value="http://www.propublica.org/about/thank-you"><input type="hidden" name="Receive_Email" value="3"><input type="hidden" name="organization_KEY" value="6253"><input type="hidden" name="email_trigger_KEYS" value="8405"><p>Receive our top stories daily</p><div class="form-row text-row"><input type="text" class="text-input" id="subscribe-email" value="Subscribe via e-mail" name="Email" /><input type="submit" value="Sign Up" class="btn-input" /></div><div class="form-row text-row"><input type="text" class="text-input" id="subscribe-zip" value="zip-code" name="Zip" /><span>optional</span></div></form></div><!-- /#banner-updates --></div><!--/.wrapper--></div><!--#banner--><div id="banner-nav"><!--[if IE]><link rel="stylesheet" href="http://www.propublica.org/css/ie.css?1301677503" type="text/css" media="screen" charset="utf-8" /><![endif]--><!--[if IE 7]><link rel="stylesheet" href="http://www.propublica.org/css/ie7.css?1301677503" type="text/css" media="screen" charset="utf-8" /><!--[if IE]><link rel="stylesheet" href="http://www.propublica.org/css/ie.css?1301677503" type="text/css" media="screen" charset="utf-8" /><![endif]--><!--[if IE 7]><link rel="stylesheet" href="http://www.propublica.org/css/ie7.css?1301677503" type="text/css" media="screen" charset="utf-8" /><![endif]-->
HTML

SMALL_HTML = small_html.strip


RSpec.configure do |config|
  
end
