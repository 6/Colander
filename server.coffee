express = require 'express'
dnode = require 'dnode'

port = 7000

server = dnode
  saySomething: (something, callback) =>
    callback("Say #{something}!!")

server.listen(port)
console.log("Listening on localhost:#{port}")
