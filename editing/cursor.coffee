Package.command 'combo-left-then-space',
  spoken: 'crimpoosh'
  enabled: true
  description: "crimp, then skoosh. Used with tragic to deal with accidental missing spaces"
  action: ->
    @do 'cursor:left'
    @key ' '
