require 'dnode'

DNode.new({}).connect('localhost', 5000) do |remote|
  remote.parse "<html><title>Example title</title><body></body></html>", proc { |error, result|
    p "Error", error, "Result", result
  }
end
