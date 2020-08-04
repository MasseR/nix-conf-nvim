{pkgs, lib, fetchgit}:

let
  buildvimPlugin = pkgs.vimUtils.buildVimPluginFrom2Nix;

in rec {
  "ghcid" = buildvimPlugin {
    name = "ghcid";
    src = (fetchgit {
      inherit (lib.importJSON ./plugins/ghcid.json) url rev sha256 fetchSubmodules;
    } + "/plugins/nvim");
  };
  "taskwiki" = buildvimPlugin {
    name = "taskwiki";
    src = fetchgit {
      inherit (lib.importJSON ./plugins/taskwiki.json) url rev sha256 fetchSubmodules;
    };
    ## XXX: I wasn't able to provide tasklib through here
  };
  "vim-trailing-whitespace" = buildvimPlugin {
    name = "vim-trailing-whitespace";
    src = fetchgit {
      inherit (lib.importJSON ./plugins/vim-trailing-whitespace.json) url rev sha256 fetchSubmodules;
    };
    dependencies = [];
  };
  "vim-haskell-indent" = buildvimPlugin {
    name = "vim-haskell-indent";
    src = fetchgit {
      inherit (lib.importJSON ./plugins/vim-haskell-indent.json) url rev sha256 fetchSubmodules;
    };
    dependencies = [];
  };
  "nerdtree" = buildvimPlugin {
    name = "nerdtree";
    src = fetchgit {
      inherit (lib.importJSON ./plugins/nerdtree.json) url rev sha256 fetchSubmodules;
    };
    dependencies = [];
  };
  "syntastic" = buildvimPlugin {
    name = "syntastic";
    src = fetchgit {
      inherit (lib.importJSON ./plugins/syntastic.json) url rev sha256 fetchSubmodules;
    };
    dependencies = [];
  };
  "xmledit" = buildvimPlugin {
    name = "xmledit";
    src = fetchgit {
      inherit (lib.importJSON ./plugins/xmledit.json) url rev sha256 fetchSubmodules;
    };
    dependencies = [];
  };
  "tcomment_vim" = buildvimPlugin {
    name = "tcomment_vim";
    src = fetchgit {
      inherit (lib.importJSON ./plugins/tcomment_vim.json) url rev sha256 fetchSubmodules;
    };
    dependencies = [];
  };
  "custom-fugitive" = buildvimPlugin {
    name = "fugitive";
    src = /home/masse/git/vim-fugitive;
    dependencies = [];
  };
  "vim-gnupg" = buildvimPlugin {
    name = "vim-gnupg";
    src = fetchgit {
      inherit (lib.importJSON ./plugins/vim-gnupg.json) url rev sha256 fetchSubmodules;
    };
    dependencies = [];
  };
  "vim-obsession" = buildvimPlugin {
    name = "vim-obsession";
    src = fetchgit {
      inherit (lib.importJSON ./plugins/vim-obsession.json) url rev sha256 fetchSubmodules;
    };
    dependencies = [];
  };
  "vim-prosession" = buildvimPlugin {
    name = "vim-prosession";
    src = fetchgit {
      inherit (lib.importJSON ./plugins/vim-prosession.json) url rev sha256 fetchSubmodules;
    };
    dependencies = [];
  };
  "ctrlp-obsession" = buildvimPlugin {
    name = "ctrlp-obsession";
    src = fetchgit {
      inherit (lib.importJSON ./plugins/ctrlp-obsession.json) url rev sha256 fetchSubmodules;
    };
    dependencies = [];
  };
  "unimpaired" = buildvimPlugin {
    name = "unimpaired";
    src = fetchgit {
      inherit (lib.importJSON ./plugins/vim-unimpaired.json) url rev sha256 fetchSubmodules;
    };
    dependencies = [];
  };
  "todotxt" = buildvimPlugin {
    name = "todo.txt-vim";
    src = fetchgit {
      inherit (lib.importJSON ./plugins/todo.txt-vim.json) url rev sha256 fetchSubmodules;
    };
  };
  "gutentags" = buildvimPlugin {
    name = "gutentags";
    src = fetchgit {
      inherit (lib.importJSON ./plugins/vim-gutentags.json) url rev sha256 fetchSubmodules;
    };
  };
  "asyncrun" = buildvimPlugin {
    name = "asyncrun";
    src = fetchgit {
      inherit (lib.importJSON ./plugins/asyncrun.json) url rev sha256 fetchSubmodules;
    };
  };
  "asynctasks" = buildvimPlugin {
    name = "asynctasks";
    src = fetchgit {
      inherit (lib.importJSON ./plugins/asynctasks.json) url rev sha256 fetchSubmodules;
    };
    dependencies = [ asyncrun ];
  };

  # Templates for xptemplate
  "customtemplates" = buildvimPlugin {
    name = "customtemplates";
    src = ./templates;
  };

  "async_cabal" = buildvimPlugin {
    name = "async_cabal";
    src = ./async_cabal;
    dependencies = [ asyncrun ];
  };
}
