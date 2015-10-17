express = require 'express'
app = express()

app.get '/', (req, res) ->
	res.send 'hello'

port = process.env.PORT or 4000
app.listen port

console.log "server started on port "+port

module.exports = app