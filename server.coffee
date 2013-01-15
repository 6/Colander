dnode = require 'dnode'

port = process.env.PORT || 5000

server = dnode
  saySomething: (something, callback) =>
    callback("Say #{something}!!")

server.listen(port)
console.log("Listening on localhost:#{port}")
