param(
  [Parameter(Mandatory)]
  [ValidateSet(
    'auto-pr',
    'checkhashes',
    'checkurls',
    'checkver',
    'formatjson',
    'missing-checkver',
    'test'
  )]
  $commandName,
  [Parameter(ValueFromRemainingArguments)]
  $args
)

if(!$env:SCOOP_HOME) {
  $env:SCOOP_HOME = Resolve-Path (scoop prefix scoop)
}

$commandScript = "$env:SCOOP_HOME/bin/$commandName.ps1"
$path = "$PSScriptRoot/../bucket" # checks the parent dir
Invoke-Expression -command "& '$commandScript' -dir '$path' $($args | ForEach-Object { "$_ " })"
