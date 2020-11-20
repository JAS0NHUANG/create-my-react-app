npm init -y

sudo npm install -g yarn

yarn add webpack webpack-cli webpack-dev-server @babel/core @babel/preset-env babel-loader react react-dom @babel/preset-react html-webpack-plugin styled-components

mkdir src
touch src/index.js src/App.js src/index.html webpack.config.js .babelrc .gitignore

sed -i '/scripts/a \ \ \ \ "start": "webpack serve --mode development --env development --hot",\n\ \ \ \ "build": "webpack --mode production",' package.json

echo "const path = require('path')
const HtmlWebpackPlugin = require('html-webpack-plugin')

module.exports = {
  entry: './src/index.js',
  output: {
    path: path.join(__dirname, '/dist'),
    filename: 'bundle.[hase].js'
  },
  module: {
    rules: [ {
      test: /\.js$/,
      exclude: /node_modules/,
      use: {
        loader: 'babel-loader'
      }
    } ]
  },
  plugins: [
    new HtmlWebpackPlugin({
      template: './src/index.html'
    })
  ]
}" > webpack.config.js

echo "{
  'presets': ['@babel/preset-env', '@babel/preset-react']
}" > .babelrc

echo "import React from 'react'

function App() { return(<h1>My React App!</h1>) }

export default App" > src/App.js

echo "import React from 'react'
import ReactDOM from 'react-dom'
import App from './App.js'

ReactDOM.render(<App />, document.getElementById('root'))" > src/index.js

echo "<!DOCTYPE html>
<html>
  <div id='root'>
  </div>
</html>" > src/index.html

echo "node_modules/
*.log
logs
dist/" > .gitignore
