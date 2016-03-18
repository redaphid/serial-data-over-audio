baudio = require 'baudio'

class SoundEmitter
  constructor: ({@baudRate, @channelHz, @channelWidth}) ->
    @b = baudio @getAudio
    @lastCharTime = Date.now()

  getAudio: (time) =>

    @getBaseAudio time

  getBaseAudio: (time) =>
    frequency = @channelHz
    frequency = @channelHz + @channelWidth if Math.random()
    sound = Math.sin(time * frequency)
    return sound



  start: =>
    @b.play()

  stop: =>
    @b.stop()




emitter = new SoundEmitter baudRate: 100, channelHz: 2000, channelWidth: 100


emitter.start()
