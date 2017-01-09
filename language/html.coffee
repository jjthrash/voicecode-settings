Package.command 'erb-angle',
  spoken: 'angle herb'
  enabled: true
  action: ->
    @string "<% %>"
    @do 'cursor:left'
    @do 'cursor:left'
    @do 'cursor:left'
