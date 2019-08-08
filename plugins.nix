{pkgs ? import <nixpkgs> {}}:

let
  buildvimPlugin = pkgs.vimUtils.buildVimPluginFrom2Nix;

in {
  "ghcid" = buildvimPlugin {
    name = "ghcid";
    src = (pkgs.fetchFromGitHub {
      owner = "ndmitchell";
      repo = "ghcid";
      rev = "9e4dbf2d3abb232ab75287d21fc3b0bb291fd8f1"; # Not the latest, before ghcid 0.7
      sha256 = "03912c7cm9rgzvqfyb9pwc6v1bbpa00b6bi97bvjn4smb7x3x8hs";
    } + "/plugins/nvim");
  };
  "taskwiki" = buildvimPlugin {
    name = "taskwiki";
    src = pkgs.fetchFromGitHub {
      owner = "tbabej";
      repo = "taskwiki";
      rev = "0c964460e6bbfba387b8a2976a3c349aa615e525";
      sha256 = "0hqb4lxdr6z52aygvlwyr37m6xvf28ipxx7hzmf3xsk5qhsvq96n";
    };
    ## XXX: I wasn't able to provide tasklib through here
  };
  "vim-trailing-whitespace" = buildvimPlugin {
    name = "vim-trailing-whitespace";
    src = pkgs.fetchFromGitHub {
      owner = "bronson";
      repo = "vim-trailing-whitespace";
      rev = "d4ad27de051848e544e360482bdf076b154de0c1";
      sha256 = "1xrx9c8d4qwf38jc44a9szw195m8rfri9bsdcj701p9s9ral0l31";
    };
    dependencies = [];
  };
  "vim-haskell-indent" = buildvimPlugin {
    name = "vim-haskell-indent";
    src = pkgs.fetchFromGitHub {
      owner = "itchyny";
      repo = "vim-haskell-indent";
      rev = "32113104e9b548e9015f296dbe5b3803652ae1fc";
      sha256 = "0x9j3lf61fsfxl94zhpff4x01nxbpm1k7mnk6ml085s35jzgv94q";
    };
    dependencies = [];
  };
  "nerdtree" = buildvimPlugin {
    name = "nerdtree";
    src = pkgs.fetchFromGitHub {
      owner = "scrooloose";
      repo = "nerdtree";
      rev = "a172d7cfcb4fe9b927dcc24184204fc89d826301";
      sha256 = "1nfk1j2n2jgrdhcahva1kq3qjj4fdn1x20xxvgl88v3j3fj62n0f";
    };
    dependencies = [];
  };
  "syntastic" = buildvimPlugin {
    name = "syntastic";
    src = pkgs.fetchFromGitHub {
      owner = "scrooloose";
      repo = "syntastic";
      rev = "d31e270cc8affc6338a9ed44e2efcaec0ca4cd34";
      sha256 = "121a1mxgfng2y5zmivyyk02mca8pyw72crivf4f1q9nhn0barf57";
    };
    dependencies = [];
  };
  "xmledit" = buildvimPlugin {
    name = "xmledit";
    src = pkgs.fetchFromGitHub {
      owner = "sukima";
      repo = "xmledit";
      rev = "d14283c6d5712a24e700f0dcbc116c44f8644780";
      sha256 = "0xprpxrykxpb0kqvi0wgan83sr3xpwha94shp05gvxd8lkbm7l6j";
    };
    dependencies = [];
  };
  "tcomment_vim" = buildvimPlugin {
    name = "tcomment_vim";
    src = pkgs.fetchFromGitHub {
      owner = "tomtom";
      repo = "tcomment_vim";
      rev = "2c1c1a6a685e006565c9b0db85df8bda71caaa30";
      sha256 = "16iw43klc2pymrkc4sci0rhnmm1sf6406l1ll1k6ax1fwhqr631f";
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
    src = pkgs.fetchFromGitHub {
      owner = "jamessan";
      repo = "vim-gnupg";
      rev = "08c4f516e8a5dbfa187188d24ccd425c14d97011";
      sha256 = "11m72nrjl0zf0i8ywpq1r4058lzlvgjydy6fvyxw5zfrd7mk4pdf";
    };
    dependencies = [];
  };
  "vim-obsession" = buildvimPlugin {
    name = "vim-obsession";
    src = pkgs.fetchFromGitHub {
      owner = "tpope";
      repo = "vim-obsession";
      rev = "d2f78ce466186839b1838c7e85115f96d051c7a5";
      sha256 = "1027iln716cmycvl4zgkqp0ybzdy7r1bl32x5l776yyjby1ssmqb";
    };
    dependencies = [];
  };
  "vim-prosession" = buildvimPlugin {
    name = "vim-prosession";
    src = pkgs.fetchFromGitHub {
      owner = "dhruvasagar";
      repo = "vim-prosession";
      rev = "3def4db2495a2c7e89ea681503dbb8fcfea8a4ae";
      sha256 = "0jdq4vz1npyxsqi5casnb7gi8raicd4xxwrvqqc255i33f6kcs2c";
    };
    dependencies = [];
  };
  "ctrlp-obsession" = buildvimPlugin {
    name = "ctrlp-obsession";
    src = pkgs.fetchFromGitHub {
      owner = "gikmx";
      repo = "ctrlp-obsession";
      rev = "ca2fabd8d1f252a869a81160d4e969066babfb05";
      sha256 = "1rwh2pvnk71gc9xf5kbkysmq2shrv4xmb1zpkwk1spb8hgsqn68a";
    };
    dependencies = [];
  };
  "unimpaired" = buildvimPlugin {
    name = "unimpaired";
    src = pkgs.fetchFromGitHub {
      owner = "tpope";
      repo = "vim-unimpaired";
      rev = "c77939c4aff30b2ed68deb1752400ec15f17c3a2";
      sha256 = "0qd9as008r2vycls48bfb163rp7dddw7l495xn4l1gl00sh79cxy";
    };
    dependencies = [];
  };
  "todotxt" = buildvimPlugin {
    name = "todo.txt-vim";
    src = pkgs.fetchFromGitHub {
      owner = "freitass";
      repo = "todo.txt-vim";
      rev = "6845221d45bd62e604c2024bc511a56e79d1118b";
      sha256 = "08m9q5f2pz6gjp0vkmm7glfsrbnldxi1j59dm5d7any6y96xxd6v";
    };
  };
  "gutentags" = buildvimPlugin {
    name = "gutentags";
    src = pkgs.fetchFromGitHub {
      owner = "ludovicchabant";
      repo = "vim-gutentags";
      rev = "eecb136fae97e30d5f01e71f0d3b775c8b017385";
      sha256 = "0i8hq0qxjrsavs3a7saz5wqibib5qd3lgfbygpclvp24ylisa8vq";
    };
  };
}
