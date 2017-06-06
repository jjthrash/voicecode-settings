Package.commands
  'bluetooth-on':
    spoken: "bluetooth on"
    enabled: true
    action: ->
      @exec "/usr/local/bin/blueutil power 1", async: true
  'bluetooth-off':
    spoken: "bluetooth off"
    enabled: true
    action: ->
      @exec "/usr/local/bin/blueutil power 0", async: true
