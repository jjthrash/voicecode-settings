Package.command 'launch-slack',
  spoken: 'slacker'
  enabled: true
  action: ->
    @key 's', ['command', 'option', 'shift']

Package.command 'launch-xcode',
  spoken: 'cody'
  enabled: true
  action: ->
    @key 'x', ['command', 'option', 'shift']

apps =
  foxy: "Google Chrome"
  turmit: "iTerm"
  skippy: "Skype"
  blimey: "LimeChat"
  safari: "Safari"
  hibari: "Hibari"
  chromium: "Google Chrome"

_.each apps, (value, key) ->
  Package.command "launch #{value.toLowerCase()}",
    spoken: key
    description: "Launch #{value}"
    enabled: true
    action: ->
      @openApplication value
