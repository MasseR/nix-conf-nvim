#!/usr/bin/env bash


nix run nixpkgs.nix-prefetch-git -c nix-prefetch-git https://github.com/skywind3000/asyncrun.vim > asyncrun.json
nix run nixpkgs.nix-prefetch-git -c nix-prefetch-git https://github.com/skywind3000/asynctasks.vim > asynctasks.json


nix run nixpkgs.nix-prefetch-git -c nix-prefetch-git https://github.com/ludovicchabant/vim-gutentags > vim-gutentags.json
nix run nixpkgs.nix-prefetch-git -c nix-prefetch-git https://github.com/tpope/vim-unimpaired > vim-unimpaired.json
nix run nixpkgs.nix-prefetch-git -c nix-prefetch-git https://github.com/tomtom/tcomment_vim > tcomment_vim.json
nix run nixpkgs.nix-prefetch-git -c nix-prefetch-git https://github.com/scrooloose/syntastic > syntastic.json
nix run nixpkgs.nix-prefetch-git -c nix-prefetch-git https://github.com/sukima/xmledit > xmledit.json
nix run nixpkgs.nix-prefetch-git -c nix-prefetch-git https://github.com/scrooloose/nerdtree > nerdtree.json
nix run nixpkgs.nix-prefetch-git -c nix-prefetch-git https://github.com/itchyny/vim-haskell-indent > vim-haskell-indent.json
nix run nixpkgs.nix-prefetch-git -c nix-prefetch-git https://github.com/bronson/vim-trailing-whitespace > vim-trailing-whitespace.json
nix run nixpkgs.nix-prefetch-git -c nix-prefetch-git https://github.com/ndmitchell/ghcid > ghcid.json
nix run nixpkgs.nix-prefetch-git -c nix-prefetch-git https://github.com/tbabej/taskwiki > taskwiki.json
nix run nixpkgs.nix-prefetch-git -c nix-prefetch-git https://github.com/gikmx/ctrlp-obsession > ctrlp-obsession.json
nix run nixpkgs.nix-prefetch-git -c nix-prefetch-git https://github.com/dhruvasagar/vim-prosession > vim-prosession.json
nix run nixpkgs.nix-prefetch-git -c nix-prefetch-git https://github.com/tpope/vim-obsession > vim-obsession.json
nix run nixpkgs.nix-prefetch-git -c nix-prefetch-git https://github.com/jamessan/vim-gnupg > vim-gnupg.json
nix run nixpkgs.nix-prefetch-git -c nix-prefetch-git https://github.com/freitass/todo.txt-vim > todo.txt-vim.json
