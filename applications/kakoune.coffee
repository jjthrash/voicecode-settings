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
  'editor:move-to-line-number-and-way-left': (input) ->
    if input?
      number = parseInt(input.toString())
      @normalKakouneCommand "" + number + "g"
      @normalKakouneCommand "gh"
  'editor:move-to-line-number-and-way-right': (input) ->
    if input?
      number = parseInt(input.toString())
      @normalKakouneCommand "" + number + "g"
      @normalKakouneCommand "gl"
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
    @string ":comment"
    @key "enter"
  'cursor:way-down': ->
    @normalKakouneCommand "gj"
  'cursor:way-up': ->
    @normalKakouneCommand "gk"
  'cursor:way-right': ->
    @normalKakouneCommand "gl"
  'cursor:way-left': ->
    @normalKakouneCommand "gh"
  'selection:way-right': ->
    @string "Gl"
  'selection:way-left': ->
    @string 'Gh'
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
  'selection:all': ->
    @string "%"
  'common:indent-left': ->
    @normalKakouneCommand "<"
  'common:indent-right': ->
    @normalKakouneCommand ">"
  'object:previous': ->
    @normalKakouneCommand "ga"
  'editor:select-line-number-range': (input) ->
    if input?
      number = input.toString()
      length = Math.floor(number.length / 2)
      first = number.substr(0, length)
      last = number.substr(length, length + 1)
      first = parseInt(first)
      last = parseInt(last)
      if last < first
        temp = last
        last = first
        first = temp
      @string "" + first + "g"
      @string "" + last + "G"
      @key "x", ["option"]
  'delete:lines': ({first, last} = {}) ->
    if last?
      @string "" + first + "g" + last + "G"
    else if first?
      @string "" + first + "g"
    @key "x", ["option"]
    @string "d"
  'editor:insert-under-line-number': (input) ->
    number = parseInt(input.toString())
    if !Number.isNaN(number)
      @string "" + number + "go"
  'cursor:new-line-above': ->
    @normalKakouneCommand "O"
  'cursor:new-line-below': ->
    @normalKakouneCommand "o"
  'os:undo': ->
    @normalKakouneCommand "u"
  'os:redo': ->
    @normalKakouneCommand "U"

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
  'kakoune-clipboard-cut':
    spoken: 'kasnatch'
    description: 'Cut to clipboard'
    enabled: true
    action: ->
      @string "|pbcopy"
      @key "enter"
  'kakoune-clipboard-copy':
    spoken: 'kastoosh'
    description: 'Copy to clipboard'
    enabled: true
    action: ->
      @key "|", ["option"]
      @string "pbcopy"
      @key "enter"
  'kakoune-clipboard-paste':
    spoken: 'kaspark'
    enabled: true
    action: ->
      @string "!pbpaste"
      @key "enter"

