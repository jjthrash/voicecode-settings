Package.command 'vim-mode-on',
  spoken: 'vim mode on'
  enabled: true
  action: ->
    Execute "/usr/local/bin/apm enable vim-mode"

Package.command 'vim-mode-off',
  spoken: 'vim mode off'
  enabled: true
  action: ->
    Execute "/usr/local/bin/apm disable vim-mode"

Package.command 'toggle-bookmark',
  spoken: "marky mark"
  enabled: true
  scope: 'atom-editor-focused'
  description: "toggle a bookmark"
  action: ->
    @key "f2", ["command"]

Package.command 'find-bookmark',
  spoken: "marky find"
  enabled: true
  scope: 'atom-editor-focused'
  description: "cycle a bookmark"
  action: ->
    @key "f2"

Package.command 'close-all-tabs',
  spoken: "totchway"
  enabled: true
  scope: 'atom-editor-focused'
  action: ->
    @openMenuBarPath(['File', 'Close All Tabs'])

atom = Packages.get 'atom'
atom.after 'atom:search-selection', (input) ->
  @do 'common:find-next'
