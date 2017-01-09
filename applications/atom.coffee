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

# per @lexjacobs
Package.commands
  'move-pane-left':
    spoken: 'pain left'
    enabled: true
    description: 'go to the left pane'
    scope: 'atom'
    action: ->
      @key 'k', 'command'
      @key 'left', 'command'

  'move-pane-right':
    spoken: 'pain right'
    enabled: true
    description: 'go to the right pane'
    scope: 'atom'
    action: ->
      @key 'k', 'command'
      @key 'right', 'command'

  'move-pane-down':
    spoken: 'pain down'
    enabled: true
    description: 'go to the below pane'
    scope: 'atom'
    action: ->
      @key 'k', 'command'
      @key 'down', 'command'

  'move-pane-up':
    spoken: 'pain up'
    enabled: true
    description: 'go to the above pane'
    scope: 'atom'
    action: ->
      @key 'k', 'command'
      @key 'up', 'command'
