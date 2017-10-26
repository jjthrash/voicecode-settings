prefixCharacter = 'a'

Package.command 'tmux-prefix',
  spoken: 'mux'
  enabled: true
  scope: 'iterm-active'
  autoSpacing: 'never never'
  multiPhraseAutoSpacing: 'never never'
  action: ->
    @key prefixCharacter, ["control"]

Package.command 'tmux-switch',
  spoken: 'muxwitch'
  enabled: true
  scope: 'iterm-active'
  autoSpacing: 'never never'
  multiPhraseAutoSpacing: 'never never'
  action: ->
    @key prefixCharacter, ["control"]
    @key "s"

Package.command 'tmux-pane',
  spoken: 'mux pane'
  enabled: true
  scope: 'iterm-active'
  autoSpacing: 'never never'
  multiPhraseAutoSpacing: 'never never'
  action: ->
    @key prefixCharacter, ["control"]
    @key "q"

Package.commands
  scope: 'iterm-active'
,
  'maximize-pane':
    spoken: "moocher"
    description: "maximize the current tmux pane"
    enabled: true
    autoSpacing: 'never never'
    multiPhraseAutoSpacing: 'never never'
    action: ->
      @key prefixCharacter, ["control"]
      @key "z"
  'go-to-previous-pane':
    spoken: "mux gopreev"
    description: "go to the previously selected pane"
    enabled: true
    autoSpacing: 'never never'
    multiPhraseAutoSpacing: 'never never'
    action: ->
      @key prefixCharacter, ["control"]
      @key ";"
