process.env.NODE_ENV = process.env.NODE_ENV || 'development'

const environment = require('./environment')

// require("uglifyjs-webpack-plugin")

// module.exports = {
//   optimization: {
//     minimizer: [
//       new UglifyJsPlugin({
//         include: /\/includes/,
//       }),
//     ],
//   },
// };

// environment.plugins.delete("UglifyJs")
// environment.plugins.append("UglifyJs", new UglifyJSPlugin())

module.exports = environment.toWebpackConfig()
