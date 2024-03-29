if executable('typescript-language-server')
  " The path needs to specified :(
  au User lsp_setup call lsp#register_server({
      \ 'name': 'tsserver',
      \ 'cmd': {server_info->['typescript-language-server', '--stdio', '--tsserver-path', fnamemodify(exepath('tsserver'), ':h:h').'/lib/node_modules/typescript/lib']},
      \ 'allowlist': ['typescript', 'typescriptreact'],
      \ })
endif
if executable('clojure-lsp')
  au User lsp_setup call lsp#register_server({
      \ 'name': 'clojure-lsp',
      \ 'cmd': {server_info->['clojure-lsp']},
      \ 'allowlist': ['clojure'],
      \ })
endif
if executable('ocamllsp')
  au User lsp_setup call lsp#register_server({
      \ 'name': 'ocamllsp',
      \ 'cmd': {server_info->['ocamllsp']},
      \ 'allowlist': ['ocaml'],
      \ })
endif
if executable('purescript-language-server')
  au User lsp_setup call lsp#register_server({
      \ 'name': 'purescript-language-server',
      \ 'cmd': {server_info->['purescript-language-server', '--stdio']},
      \ 'allowlist': ['purescript'],
      \ })
endif
if executable('dhall-lsp-server')
  au User lsp_setup call lsp#register_server({
      \ 'name': 'dhall-lsp',
      \ 'cmd': {server_info->['dhall-lsp-server']},
      \ 'allowlist': ['dhall'],
      \ })
endif
if executable('rnix-lsp')
  au User lsp_setup call lsp#register_server({
      \ 'name': 'rnix-lsp',
      \ 'cmd': {server_info->['rnix-lsp']},
      \ 'allowlist': ['nix'],
      \ })
endif
if executable('nil')
  au User lsp_setup call lsp#register_server({
      \ 'name': 'nil',
      \ 'cmd': {server_info->['nil']},
      \ 'allowlist': ['nix'],
      \ })
endif
if executable('haskell-language-server-wrapper')
  au User lsp_setup call lsp#register_server({
      \ 'name': 'haskell-lsp',
      \ 'cmd': {server_info->['haskell-language-server-wrapper', '--lsp']},
      \ 'allowlist': ['haskell'],
      \ })
endif

function! s:on_lsp_buffer_enabled() abort
  setlocal omnifunc=lsp#complete
  setlocal signcolumn=yes
  if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
  nmap <buffer> gd <plug>(lsp-definition)
  nmap <buffer> gr <plug>(lsp-references)
  nmap <buffer> gi <plug>(lsp-implementation)
  nmap <buffer> gt <plug>(lsp-type-definition)
  nmap <buffer> <leader>rn <plug>(lsp-rename)
  nmap <buffer> [n <Plug>(lsp-previous-diagnostic)
  nmap <buffer> ]n <Plug>(lsp-next-diagnostic)
  nmap <buffer> K <plug>(lsp-hover)
  nmap <buffer> <leader>a <plug>(lsp-code-action)
  nmap <buffer> <leader>cl <plug>(lsp-code-lens)
  nmap <buffer> <leader>dd <plug>(lsp-document-diagnostics)

  " refer to doc to add more commands
endfunction

augroup lsp_install
  au!
  " call s:on_lsp_buffer_enabled only for languages that has the server registered.
  autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END
