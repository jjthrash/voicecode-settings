Package.command 'git-commit-amend',
  spoken: 'jet amend'
  enabled: true
  autoSpacing: "never always"
  action: ->
    @string "git commit --amend"

Package.command 'git-add-patch',
  spoken: 'jet patchett'
  enabled: true
  autoSpacing: "never normal"
  action: ->
    @string "git add --patch"

Package.command 'git-merge-delete',
  spoken: 'jet merge delete'
  enabled: true
  autoSpacing: "never always"
  action: ->
    @string "git merge-delete"

Package.command 'git-check-out',
  spoken: 'jet check out'
  enabled: true
  autoSpacing: "never always"
  action: ->
    @string "git checkout"

Package.command 'git-reset-hard',
  spoken: 'jet reset hard'
  enabled: true
  autoSpacing: "never always"
  multiPhraseAutoSpacing: "never always"
  action: ->
    @string "git reset --hard"

Package.command 'git-gitx',
  spoken: 'jet trex'
  enabled: true
  autoSpacing: "never always"
  multiPhraseAutoSpacing: "never always"
  action: ->
    @string "gitx"

# git  = Packages.get 'git'
# git.after 'git:git-commit',


_.extend Commands.get('git:git-command merge'),
  autoSpacing: 'never always'
  multiPhraseAutoSpacing: 'never always'

_.extend Commands.get('git:git-command'),
  autoSpacing: 'never always'
  multiPhraseAutoSpacing: 'never always'
