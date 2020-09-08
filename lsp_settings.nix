{ servers ? {} }:

# I'm not hardcoding the binary with nix in the generic configuration, because
# there might be language servers that depend on the project packages, in which
# case the tooling should be provided by the shell
let mkServer = language: binary:
  ''
  if executable('${binary}')
    au User lsp_setup call lsp#register_server({
        \ 'name': '${language}-lsp',
        \ 'cmd': {server_info->['${binary}']},
        \ 'allowlist': ['${language}'],
        \ })
  endif
  '';

in

with builtins;
''
${concatStringsSep "\n" (attrValues (mapAttrs mkServer servers))}

function! s:on_lsp_buffer_enabled() abort
  setlocal omnifunc=lsp#complete
  setlocal signcolumn=yes
  if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
  nmap <buffer> gd <plug>(lsp-definition)
  nmap <buffer> gr <plug>(lsp-references)
  nmap <buffer> gi <plug>(lsp-implementation)
  nmap <buffer> gt <plug>(lsp-type-definition)
  nmap <buffer> <leader>rn <plug>(lsp-rename)
  nmap <buffer> [g <Plug>(lsp-previous-diagnostic)
  nmap <buffer> ]g <Plug>(lsp-next-diagnostic)
  nmap <buffer> K <plug>(lsp-hover)

  " refer to doc to add more commands
endfunction

augroup lsp_install
  au!
  " call s:on_lsp_buffer_enabled only for languages that has the server registered.
  autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END
''
