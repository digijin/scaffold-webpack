webpack = require 'webpack'
path = require 'path'

module.exports = [
	name: 'client'
	context: __dirname + '/src/client'
	entry: 
		client: './index'
	output:
		path: __dirname + '/build/client'
		filename: 'build.js'
	module:
		loaders: [
			test: /\.coffee/
			loader: 'coffee-loader'
		,
			test: /\.jsx/
			loader: 'babel-loader'
		,
			test: /.html/
			loader: 'ejs-loader'
		]
	resolve:
		root: [
			path.join __dirname, 'bower_components'
			path.join __dirname, 'src', 'client'
		]
		extensions: [
			''
			'.html'
			'.js'
			'.coffee'
			'.jade'
		]
	plugins: [
		new webpack.ResolverPlugin new webpack.ResolverPlugin.DirectoryDescriptionFilePlugin "bower.json", ["main"]
		(compiler) ->
			@plugin 'done', (stats) ->
				require 'fs'
					.writeFileSync path.join(__dirname, 'stats.json'), JSON.stringify stats.toJson()
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
		loaders: [
			test: /\.coffee/
			loader: 'coffee-loader'
		# ,
		# 	test: /\.jsx/
		# 	loader: 'babel-loader'
		# ,
		# 	test: /.html/
		# 	loader: 'ejs-loader'
		]
	resolve:
		root: [
			path.join __dirname, 'bower_components'
			path.join __dirname, 'src', 'client'
		]
		extensions: [
			''
			'.html'
			'.js'
			'.coffee'
			'.jade'
		]
]