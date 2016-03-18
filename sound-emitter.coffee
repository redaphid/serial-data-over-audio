baudio = require 'baudio'

class SoundEmitter
  constructor: ({@baudRate, @channelHz, @channelWidth}) ->
    @b = baudio @getAudio
    @writingChar = false

  getAudio: (time) =>
    return 0 unless @playing
    @getBaseAudio time

  getBaseAudio: (time) =>
    frequency = @channelHz

    if @writingChar
      frequency += @channelWidth
      console.log 'writing character'
      if (Date.now() - @beganWriting) > 1000
        @writingChar = false

    sound = Math.sin(time * frequency)
    return sound


  writeBit: ->
    @beganWriting = Date.now()
    @writingChar = true

  start: =>
    @b.play()

  play: =>
    @playing = true

  pause: =>
    @playing = false



module.exports = SoundEmitter
