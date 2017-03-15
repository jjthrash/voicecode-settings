pack = Packages.register
  name: "kakoune"
  description: "Special support for the kakoune editor"

#Scope.register
#  name: 'kakoune',
#  application: 'com.googlecode.iterm2',
#  conditions: (input, context) ->
#    result = @exec("is-kakoune-focused")
#    log 'kakoune-scope', result
#    result == "yes"
#
##Scope.active('my-custom-scope') => Boolean
#
pack.api
  normalKakouneCommand:
    signature: 'normalKakouneCommand : (command: String) => void'
    action: (command) ->
      @key "q", ["control"]
      @string command

#pack.implement
#  scope: 'kakoune'
#,
#  'common:find': ->
#    log 'kakoune', 'Command template ' + @exec("/Users/jjthrash/bin/build-current-kakoune-command-template.sh")
#    log 'kakoune', 'SSID' + @exec('/Users/jjthrash/bin/ooga')
#    log 'kakoune', 'whoami ' + @exec('whoami')
#    log 'kakoune', 'sessions ' + @exec('tmux list-sessions')
#    #@exec("run-kakoune-command-in-current vc-common-find")

pack.implement
  scope: 'iterm-active'
,
  'editor:move-to-line-number': (input) ->
    if input?
      @normalKakouneCommand input + "g"
  'window:new-tab': ->
    @normalKakouneCommand ":fe"
    @key "enter"
  'common:save': ->
    @normalKakouneCommand ":w"
    @key "enter"
  'window:close': ->
    @string ":q"
    @key "enter"
  'editor:toggle-comments': ->
    @key "s", ["option"]
    @string "i//"
    @key "escape"
  'cursor:way-down': ->
    @normalKakouneCommand "gj"
  'cursor:way-up': ->
    @normalKakouneCommand "gk"
  'cursor:way-right': ->
    @normalKakouneCommand "gl"
  'cursor:way-left': ->
    @normalKakouneCommand "gh"
  'atom:pane-control': ({paneAction, whichPane}) ->
    switch paneAction
      when 'fog'
        @key "a", ["control"]
        @key whichPane
      when 'split'
        switch whichPane
          when 'left', 'right'
            @normalKakouneCommand ":tmux-new-horizontal"
          when 'up', 'down'
            @normalKakouneCommand ":tmux-new-vertical"
        @key "enter"

pack.commands
  scope: 'iterm-active'
,
  'select-alternate-file':
    spoken: 'turno'
    description: 'select an alternate file, if appropriate'
    enabled: true
    action: ->
      @string ":alt"
      @key "enter"
  'center-current-line':
    spoken: 'scrappy'
    description: 'Center the line the current cursor is on in the middle of the screen'
    enabled: true
    action: ->
      @string "vv"

