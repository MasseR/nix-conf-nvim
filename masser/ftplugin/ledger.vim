" I use this when I'm reconciling values
noremap <buffer> <leader>c :call ledger#transaction_state_toggle(line('.'), ' *!'))<cr>

" The default completion is something like
" hledger -f '%' accounts
" which doesn't work when you have assertions set, as the assertions take
" included files into consideration, which are not visible from the %
" Instead, use the global hledger which I have set properly on all of my
" machines
let g:ledger_accounts_cmd='hledger accounts'

" The g:ledger_main behavior is broken in the latest versions, for example
" makeprg is set to
" (hledger -f g:ledger_main::S print > /dev/null)
" and of course a file namd g:ledger_main doesn't exist ¯\_(ツ)_/¯
"
" I'm anyway setting this value as well. Same reasoning as for accounts
let g:ledger_main='/home/masse/.hledger.journal'
