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
  prefixNormalKakouneCommand:
    signature: 'prefixNormalKakouneCommand : () => void'
    action: ->
      @key "q", ["control"]
  normalKakouneCommand:
    signature: 'normalKakouneCommand : (command: String) => void'
    action: (command) ->
      @prefixNormalKakouneCommand()
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
      @normalKakouneCommand "/"
      @string "\\n"
      @key "enter"
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
    @normalKakouneCommand "/"
    @string "\\n"
    @key "enter"
  'cursor:way-left': ->
    @normalKakouneCommand "gh"
  'selection:way-right': ->
    @string "Gl"
  'selection:way-left': ->
    @string 'Gh'
  'selection:previous-word-by-surrounding-characters': (input) ->
    term = input?.value
    if term?.length
      first = term[0]
      last = term[term.length - 1]
      @prefixNormalKakouneCommand()
      @key "/", ["option"]
      @string first + "\\w+" + last
      @key "enter"
  'selection:next-word-by-surrounding-characters': (input) ->
    term = input?.value
    if term?.length
      first = term[0]
      last = term[term.length - 1]
      @normalKakouneCommand "/"
      @string first + "\\w+" + last
      @key "enter"

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
    @normalKakouneCommand "%"
  'selection:word-left': ->
    @normalKakouneCommand "B"
  'selection:word-right': ->
    @normalKakouneCommand "E"
  'selection:right': ->
    @normalKakouneCommand "L"
  'selection:left': ->
    @normalKakouneCommand "H"
  'selection:down': ->
    @normalKakouneCommand "J"
  'selection:up': ->
    @normalKakouneCommand "K"
  'selection:way-down': ->
    @normalKakouneCommand "Gj"
  'selection:way-up': ->
    @normalKakouneCommand "Gk"
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
      @prefixNormalKakouneCommand()
      @string "" + first + "g"
      @prefixNormalKakouneCommand()
      @string "" + last + "G"
      @prefixNormalKakouneCommand()
      @key "x", ["option"]
  'delete:lines': ({first, last} = {}) ->
    if last?
      @normalKakouneCommand "" + first + "g"
      @normalKakouneCommand "" + last + "G"
    else if first?
      @normalKakouneCommand "" + first + "g"
    @prefixNormalKakouneCommand()
    @key "x", ["option"]
    @normalKakouneCommand "d"
  'delete:word': ->
    @normalKakouneCommand "B"
    @normalKakouneCommand "d"
  'editor:insert-under-line-number': (input) ->
    number = parseInt(input.toString())
    if !Number.isNaN(number)
      @normalKakouneCommand "" + number + "g"
      @normalKakouneCommand "o"
  'cursor:new-line-above': ->
    @normalKakouneCommand "O"
  'cursor:new-line-below': ->
    @normalKakouneCommand "o"
  'os:undo': ->
    @normalKakouneCommand "u"
  'os:redo': ->
    @normalKakouneCommand "U"
  'cursor:way-right-then-space': ->
    @normalKakouneCommand "A"
    @string " "
    @key "escape"
    @key "right"
#  'selection:previous-occurrence': (input) ->
#    if input?.length
#      @prefixNormalKakouneCommand()
#      @key "escape"
#      @string "/" + input
#      @key "enter"
  'common:find': ->
    @normalKakouneCommand "/"
  'common:find-next': ->
    @normalKakouneCommand "n"
  'common:find-previous': ->
    @prefixNormalKakouneCommand()
    @key "n", ["option"]
  'atom:search-selection': ->
    @string "*n"
  'common:find': ->
    @normalKakouneCommand "/"
  'selection:next-occurrence': (input) ->
    term = input?.value
    if term?.length
      @normalKakouneCommand "/"
      @string term
      @key "enter"
  'selection:previous-occurrence': (input) ->
    term = input?.value
    if term?.length
      @prefixNormalKakouneCommand()
      @key "/", ["option"]
      @string term
      @key "enter"
  'selection:extend-to-next-occurrence': (input) ->
    term = input?.value
    if term?.length
      @normalKakouneCommand "?"
      @string term
      @key "enter"
  'selection:extend-to-previous-occurrence': (input) ->
    term = input?.value
    if term?.length
      @prefixNormalKakouneCommand()
      @key "/", ["option", "shift"]
      @string term
      @key "enter"
  'selection:next-word': ->
    @normalKakouneCommand "/"
    @string "\\w+"
    @key "enter"
  'selection:previous-word': ->
    @prefixNormalKakouneCommand()
    @key "/", ["option"]
    @string "\\w+"
    @key "enter"
  'text-manipulation:nudge-text-left': ->
    @normalKakouneCommand "b"
    @key "left"
    @normalKakouneCommand "d"
  'object:duplicate': ->
    @normalKakouneCommand "yp"
#  'format:upper-camel': (input) ->
#    if input?
#      @string Transforms.stud(input)
#    else
#      @normalKakouneCommand "|pbcopy"
#      @key "enter"
#      text = @getClipboard()
#      @normalKakouneCommand "i"
#      @string Transforms.stud(text)
#      @key "escape"

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
      @normalKakouneCommand "vv"
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
#  'kakoune-reverse-find':
#    spoken: 'remarko'
#    enabled: true
#    action: ->
#      @normalKakouneCommand ""

