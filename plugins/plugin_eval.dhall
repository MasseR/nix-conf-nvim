let Text/concatMapSep = https://prelude.dhall-lang.org/v18.0.0/Text/concatMapSep sha256:c272aca80a607bc5963d1fcb38819e7e0d3e72ac4d02b1183b1afb6a91340840
let Plugin = ./Plugin.dhall
let plugins = ./plugins.dhall
let prefetch =
  \(p : Plugin.Type) ->
  ''
  prefetch "${p.name}" "${p.url}"
  ''
in
''
${Text/concatMapSep "\n" Plugin.Type prefetch plugins}
''

