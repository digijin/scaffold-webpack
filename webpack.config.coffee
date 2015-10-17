webpack = require 'webpack'
path = require 'path'

module.exports = 
	context: __dirname + '/src/client'
	entry: './index'
	output:
		path: __dirname + '/build/public'
		filename: 'build.js'
	module:
		loaders: [
			test: /\.coffee/
			loader: 'coffee-loader'
		,
			test: /\.jsx/
			loader: 'babel-loader'
		,
			test /.html/
			loader: 'ejs-loader'
		]
	resolve:
		root: [
			path.join __dirname, 'bower_components'
		]
		extensions: [
			''
			'.html'
			'.js'
			'.coffee'
			'.jade'
		]
		plugins: [
			new webpack.ResolverPlugin
				new webpack.ResolverPlugin.DirectoryDescriptionFilePlugin "bower.json", ["main"]
		]

