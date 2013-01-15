require 'dnode'

html = "<html><title>Example title</title><body data-shout='Yo!'></body></html>"
code = "result['title'] = $('title').text();" +
       "result['shout'] = $('body').data('shout');"

DNode.new({}).connect('localhost', 5000) do |remote|
  remote.parse html, code, proc { |result|
    p "Result", result
  }
end
