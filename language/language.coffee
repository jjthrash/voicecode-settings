Package.command 'pick-last-word',
  spoken: 'tickle'
  grammarType: "textCapture"
  enabled: true
  autoSpacing: "normal normal"
  multiPhraseAutoSpacing: "normal normal"
  action: (input) ->
    if input
      @string input[input.length-1]

Package.command 'pick-first-word',
  spoken: 'pickle'
  grammarType: "textCapture"
  enabled: true
  autoSpacing: "normal normal"
  multiPhraseAutoSpacing: "normal normal"
  action: (input) ->
    if input
      @string input[0]

Package.command 'email-greeting',
  spoken: 'greet'
  grammarType: "textCapture"
  continuous: false
  enabled: true
  action: (input) ->
    if input
      @string "Hey " + Transforms.titleSentance(input) + ","
    else
      @string "Hey, "
