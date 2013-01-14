require 'dnode'

DNode.new({}).connect('localhost', 7000) do |remote|
  remote.saySomething "hello world", proc { |x|
    puts "x=<#{x}>"
  }
end
