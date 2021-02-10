-- The type representing plugins
-- Name is the name of the plugin. This will end up being the file name of the prefetch-git info. It will also be the name of the nix derivation
-- URL is the git repository
-- Dependencies is an optional list of dependencies, used as an input to the buildvimPlugin section

let Plugin =
  { Type =
    { name : Text
    , url : Text
    , dependencies : List Text
    }
  , default = {
      dependencies = [] : List Text
    }
  }
in Plugin
