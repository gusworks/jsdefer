puts "-------> included <----------"
module ActionView
  module Base
    def defer(tag)
      puts "------> ok <-------------"
    end
  end
end
