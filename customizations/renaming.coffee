Settings.alphabet =
  letters:
    l: 'lloyd'

renames =
  'scrump': 'selection:word-right'
  'shemmy': 'symbols:semicolon'

_.each renames, (value, key) ->
  Package.command "renamed-#{key}",
    spoken: key
    enabled: true
    action: ->
      @do value
