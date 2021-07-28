let Plugin = ./Plugin.dhall

in    [ Plugin::{
        , name = "asyncrun"
        , url = "https://github.com/skywind3000/asyncrun.vim"
        }
      , Plugin::{
        , name = "asynctasks"
        , url = "https://github.com/skywind3000/asynctasks.vim"
        , dependencies = [ "asyncrun" ]
        }
      , Plugin::{
        , name = "vim-gutentags"
        , url = "https://github.com/ludovicchabant/vim-gutentags"
        }
      , Plugin::{
        , name = "vim-unimpaired"
        , url = "https://github.com/tpope/vim-unimpaired"
        }
      , Plugin::{
        , name = "tcomment_vim"
        , url = "https://github.com/tomtom/tcomment_vim"
        }
      , Plugin::{
        , name = "syntastic"
        , url = "https://github.com/scrooloose/syntastic"
        }
      , Plugin::{ name = "xmledit", url = "https://github.com/sukima/xmledit" }
      , Plugin::{
        , name = "nerdtree"
        , url = "https://github.com/scrooloose/nerdtree"
        }
      , Plugin::{
        , name = "vim-haskell-indent"
        , url = "https://github.com/itchyny/vim-haskell-indent"
        }
      , Plugin::{
        , name = "vim-trailing-whitespace"
        , url = "https://github.com/bronson/vim-trailing-whitespace"
        }
      , Plugin::{
        , name = "vim-gnupg"
        , url = "https://github.com/jamessan/vim-gnupg"
        }
      , Plugin::{
        , name = "vim-lsp"
        , url = "https://github.com/MasseR/vim-lsp"
        , comment = Some "Fork has the wingman root"
        }
      , Plugin::{
        , name = "vim-ghcid-quickfix"
        , url = "https://github.com/aiya000/vim-ghcid-quickfix"
        }
      , Plugin::{
        , name = "vim-zettel"
        , url = "https://github.com/michal-h21/vim-zettel"
        }
      ]
    : List Plugin.Type
