Package.command 'delete-symmetrical',
  spoken: 'slurp'
  enabled: true
  action: ->
    @do 'common:delete'
    @do 'common:forward-delete'
