dnode = require 'dnode'
jsdom = require 'jsdom'
fs = require 'fs'
jquerySrc = fs.readFileSync("./vendor/jquery.js").toString()

port = process.env.PORT || 5000

server = dnode
  parse: (html, callback) =>
    try
      jsdom.env
        html: html
        src: jquerySrc
        done: (err, window) =>
          if err?
            callback("Error parsing HTML", null)
          else
            $ = window.$
            callback(null, $("title").text())
    catch err
      callback("Error initializing JSDOM", null)

server.listen(port)
console.log("Listening on localhost:#{port}")
