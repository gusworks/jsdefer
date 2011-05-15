class JsDefer
 
  def initialize
    @file_list = []
    @script_list = []
  end
  
  def push_file(file)
    @file_list << file
  end
  
  def push_script(script)
    @script_list << script
  end
    
  def flush
    ret = ""
    @file_list.each do |file|
      puts "[#{file}]"
      ret += "#{file}\n"
    end

    @script_list.each do |script|
      puts "[#{script}]"
      ret += "#{script}\n"
    end
    
    @file_list.clear
    @script_list.clear

    ret
  end
  
  @@instance = JsDefer.new

  def self.instance
    @@instance
  end
end

module ActionView
  class Base
    def defer(tag)
   
      JsDefer.instance.push_file tag
    end
    
    def render_js
      JsDefer.instance.flush
    end
    
  end
end
