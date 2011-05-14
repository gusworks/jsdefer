puts "-------> included <----------"
module ActionView
  class Base
    def defer(tag)
      puts "------> ok <-------------"
    end
  end
end
