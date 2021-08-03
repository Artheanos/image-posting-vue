const {environment} = require('@rails/webpacker')
const {VueLoaderPlugin} = require('vue-loader')
const vue = require('./loaders/vue')
const dotenv = require('./loaders/dotenv')

environment.config.merge(dotenv)

environment.plugins.prepend('VueLoaderPlugin', new VueLoaderPlugin())
environment.loaders.prepend('vue', vue)
module.exports = environment
