let Plugin = ./Plugin.dhall

in  { asyncrun = Plugin::{ url = "https://github.com/skywind3000/asyncrun.vim" }
    , asynctasks = Plugin::{
      , url = "https://github.com/skywind3000/asynctasks.vim"
      , dependencies = [ "asyncrun" ]
      }
    , vim-gutentags = Plugin::{
      , url = "https://github.com/ludovicchabant/vim-gutentags"
      }
    , vim-unimpaired = Plugin::{
      , url = "https://github.com/tpope/vim-unimpaired"
      }
    , tcomment_vim = Plugin::{ url = "https://github.com/tomtom/tcomment_vim" }
    , syntastic = Plugin::{ url = "https://github.com/scrooloose/syntastic" }
    , xmledit = Plugin::{ url = "https://github.com/sukima/xmledit" }
    , nerdtree = Plugin::{ url = "https://github.com/scrooloose/nerdtree" }
    , vim-haskell-indent = Plugin::{
      , url = "https://github.com/itchyny/vim-haskell-indent"
      }
    , vim-trailing-whitespace = Plugin::{
      , url = "https://github.com/bronson/vim-trailing-whitespace"
      }
    , vim-gnupg = Plugin::{ url = "https://github.com/jamessan/vim-gnupg" }
    , vim-lsp = Plugin::{
      , url = "https://github.com/MasseR/vim-lsp"
      , comment = Some "Fork has the wingman root"
      }
    , vim-ghcid-quickfix = Plugin::{
      , url = "https://github.com/aiya000/vim-ghcid-quickfix"
      }
    , vim-zettel = Plugin::{ url = "https://github.com/michal-h21/vim-zettel" }
    , vim-ledger = Plugin::{
      , url = "https://github.com/gregorias/vim-ledger"
      , comment = Some "The upstream one has a bug in how it handles hledger"
      }
    }
