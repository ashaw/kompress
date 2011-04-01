module Kompress
  class CSS
    attr_reader :css
  
    def initialize(css)
      @css = css
    
      # take out new lines
      @css.gsub!(/\n/,'')
      
      # take out comments
      @css.gsub!(/(\/\*.*?\*\/)/,' ')
      
      # take out spaces between selectors and rule blocks
      @css.gsub!(/([\.a-zA-Z0-9_\-\#]+?)\s*\{\s*([^\{\}\s])?/,'\1{\2')

      # take out spaces between rule block endings and selectors
      @css.gsub!(/\}\s*([\.a-zA-Z0-9_\-\#]+?)/,'}\1')

      # take out spaces between rules
      @css.gsub!(/(\:|;)(\s+)?([^;\:]+)?/,'\1\3')

      @css
    end
  end
  
  class HTML
    attr_reader :html
    
    def initialize(html)
      @html = html
      @html.gsub!(/(?:^|\s+?)(<.*?>)/, '\1')
      @html
    end
  end
end