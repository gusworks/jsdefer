module ActionView
  class JsDefer
    def initialize
      @tag_list = []
    end
    
    def push(tag)
      @tag_list << tag
    end
    
    def flush
      ret = ""
      @tag_list.each do |tag|
        ret += tag
      end
      
      @tag_list = []
      
      ret
    end
  end

  class Base
    def defer(tag)
      @defer = JsDefer.new unless @defer
      @defer.push tag
    end
    
    def render_js
      @defer.flush if @defer
    end
    
  end
end
