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
    'gopreev': 'checkout -'

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

# git  = Packages.get 'git'
# git.after 'git:git-commit',


_.extend Commands.get('git:git-command merge'),
  autoSpacing: 'never always'
  multiPhraseAutoSpacing: 'never always'

_.extend Commands.get('git:git-command'),
  autoSpacing: 'never always'
  multiPhraseAutoSpacing: 'never always'
