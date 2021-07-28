let List/map = (./Prelude.dhall).List.map
let Plugin = ./Plugin.dhall
let Input = { mapKey : Text, mapValue : Plugin.Type }
in List/map Input Text ( \(p : Input) -> p.mapKey ) (toMap ./plugins.dhall)
