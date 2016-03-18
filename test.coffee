SoundEmitter = require './sound-emitter.coffee'

emitter = new SoundEmitter baudRate: 100, channelHz: 2000, channelWidth: 100

module.exports = emitter
