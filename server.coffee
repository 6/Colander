dnode = require 'dnode'
jsdom = require 'jsdom'
fs = require 'fs'
jquerySrc = fs.readFileSync("./vendor/jquery.js").toString()

port = process.env.PORT || 5000

server = dnode
  parse: (html, code, callback) =>
    try
      jsdom.env
        html: html
        src: jquerySrc
        done: (err, window) =>
          if err?
            callback(error: "yes")
          else
            $ = window.$
            result = {error: "no"}
            eval(code) # lol
            callback(result)
    catch err
      callback(error: "yes")

server.listen(port)
console.log("Listening on localhost:#{port}")
