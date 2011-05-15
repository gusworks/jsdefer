class JsDefer
  puts "<--JsDefer-->"
  def self.push(tag)
    self.tag_list = [] unless self.tag_list
    self.tag_list << tag
  end
  
  def self.flush
    self.tag_list = [] unless self.tag_list
    ret = ""
    self.tag_list.each do |tag|
      ret += tag
    end
    
    self.tag_list = []
    
    ret
  end
end

puts "<--------->"

module ActionView
  puts "<--ActionView-->"
  class Base
    puts "<--Base-->"
    def defer(tag)
      JsDefer.push tag
    end
    
    def render_js
      JsDefer.flush
    end
    
  end
end
