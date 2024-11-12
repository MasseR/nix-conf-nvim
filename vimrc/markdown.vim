" The markdown plugin has issues with bullets and wrapping. It relates to
" considering the - sign as a comment marker

" Disable the auto bullets from the markdown plugin
let g:vim_markdown_auto_insert_bullets = 0
autocmd FileType markdown set comments=fb:*,fb:+,fb:-,n:> indentexpr=

" BULLETS, gives us the ability to get some bullet automation back
let g:bullets_outline_levels = ['num', 'abc', 'std*', 'std+', 'std-']

" ...
" ...
" This is insanity. Apparently the _core_ markdown ftplugin overrides the sw
" to 4
let g:markdown_recommended_style = 0

