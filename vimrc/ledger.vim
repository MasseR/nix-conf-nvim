au FileType ledger noremap <buffer> { ?^\d<CR>
au FileType ledger noremap <buffer> } /^\d<CR>

au FileType ledger noremap <buffer> <C-Space> :call ledger#transaction_state_toggle(line('.'), '*! ')<cr>

" Enable folding
au FileType ledger setlocal foldmethod=syntax

" Align
au FileType ledger vnoremap <buffer> <silent> <Tab> :LedgerAlign<cr>

" The tooling seems to prefer 4 width, let's not fight
au FileType ledger setlocal softtabstop=4
au FileType ledger setlocal shiftwidth=4
au FileType ledger setlocal tabstop=4

let g:ledger_decimal_sep = ','
let g:ledger_default_commodity = '€'
let g:ledger_commodity_before = 0
let g:ledger_date_format = '%Y-%m-%d'
