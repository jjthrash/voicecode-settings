Settings.git =
  options:
    'merge delete': 'merge-delete'
    'reset hard': 'reset --hard'
    'amend': 'commit --amend'
    'patchett': 'add --patch'
    'check out': 'checkout'
    'redo': 'commit --amend -CHEAD'
    'fixup': 'commit --fixup'
    'fix up': 'commit --fixup'
    'current branch': 'current-branch'
    'recent branch': 'recent-branch'
    'recent branch remote': 'recent-branch -r'
    'gopreev': 'checkout -'
    'store current branch': 'current-branch | pbcopy'
    'status log': 'sg'

Package.command 'git-gitx',
  spoken: 'jet trex'
  enabled: true
  autoSpacing: "never always"
  multiPhraseAutoSpacing: "never always"
  action: ->
    @string "gitx"

Package.command 'git-commit',
  spoken: 'jet commit'
  enabled: true
  autoSpacing: 'normal never'
  description: "My version"
  multiPhraseAutoSpacing: 'normal never'
  action: ->
    @string "git commit -m \"\""
    @left()

Package.commands
  'get-recent-branch':
    spoken: 'jet get recent branch'
    description: 'print out the nth most recent branch'
    enabled: true
    grammarType: "textCapture"
    action: (input) ->
      @string "git recent-branch | awk 'NR == " + input + " { print $NF }'"

# git  = Packages.get 'git'
# git.after 'git:git-commit',


_.extend Commands.get('git:git-command merge'),
  autoSpacing: 'never always'
  multiPhraseAutoSpacing: 'never always'

_.extend Commands.get('git:git-command'),
  autoSpacing: 'never always'
  multiPhraseAutoSpacing: 'never always'
