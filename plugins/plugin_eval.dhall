let Text/concatMapSep = https://prelude.dhall-lang.org/v18.0.0/Text/concatMapSep
let Plugin = { name : Text, url : Text }
let plugins = ./plugins.dhall
let prefetch =
  \(p : Plugin) ->
  ''
  prefetch "${p.name}" "${p.url}"
  ''
in
''
${Text/concatMapSep "\n" Plugin prefetch plugins}
''

