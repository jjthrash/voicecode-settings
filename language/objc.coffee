Package.command 'initialize-object',
  spoken: 'makeola'
  grammarType: 'textCapture'
  enabled: true
  scope: 'atom-editor-focused'
  action: (input) ->
    # this drives the following objective-c snippet: $1 *$2 = [[$1 alloc] init$3];
    @string 'alloc'
    @do 'common:tab'
    @string Transforms.stud(input)
    @do 'common:tab'
    @string Transforms.firstLetters(input)
    @do 'common:tab'
