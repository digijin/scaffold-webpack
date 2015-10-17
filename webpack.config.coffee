webpack = require 'webpack'
path = require 'path'
fs = require 'fs'

loaders = [
	test: /\.coffee/
	loader: 'coffee-loader'
,
	test: /\.json/
	loader: 'json-loader'
,
	test: /\.jsx/
	loader: 'babel-loader'
,
	test: /.html/
	loader: 'ejs-loader'
]
exts = [
	''
	'.html'
	'.js'
	'.coffee'
	'.jade'
]

module.exports = [
	name: 'client'
	context: __dirname + '/src/client'
	entry: 
		client: './index'
	output:
		path: __dirname + '/build/client'
		filename: 'build.js'
	module:
		loaders: loaders
	resolve:
		root: [
			path.join __dirname, 'bower_components'
			path.join __dirname, 'src', 'client'
		]
		extensions: exts
	plugins: [
		new webpack.ResolverPlugin new webpack.ResolverPlugin.DirectoryDescriptionFilePlugin "bower.json", ["main"]
		(compiler) ->
			@plugin 'done', (stats) ->
				fs.writeFileSync path.join(__dirname, 'build', 'client', 'stats.json'), 
					JSON.stringify stats.toJson()
	]
,
	name: 'server'
	context: __dirname + '/src/server'
	entry: './index'
	target: 'node'
	output: 
		path: __dirname + '/build'
		filename: 'build.js'
	module:
		loaders: loaders
	resolve:
		root: [
			path.join __dirname, 'src', 'server'
		]
		extensions: exts
	plugins: [
		new webpack.ResolverPlugin new webpack.ResolverPlugin.DirectoryDescriptionFilePlugin "bower.json", ["main"]
		(compiler) ->
			@plugin 'done', (stats) ->
				fs.writeFileSync path.join(__dirname, 'build', 'stats.json'), 
					JSON.stringify stats.toJson()
	]
]