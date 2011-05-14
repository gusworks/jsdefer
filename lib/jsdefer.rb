class JsDefer
  @tag_list = []

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

defer = JsDefer.new

module ActionView
  class Base
    def defer(tag)
      defer.push tag
    end
    
    def render_js
      defer.flush
    end
  end
end
