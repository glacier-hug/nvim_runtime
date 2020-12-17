
""""""""""""""""""""""""""""""
" => Appearance
""""""""""""""""""""""""""""""

" => vim-airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 0
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = ' '
let g:airline_theme='bubblegum'

function! LinterStatus() abort
    let l:counts = ale#statusline#Count(bufnr(''))

    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors

    return l:counts.total == 0 ? 'OK' : printf(
    \   '%dW %dE',
    \   all_non_errors,
    \   all_errors
    \)
endfunction
set statusline=%{LinterStatus()}


" => tagbar
nmap <F4> :TagbarToggle<CR>　

" => UndoTree
nnoremap <F5> :UndotreeToggle<cr>

" => Vimroom
let g:goyo_width=100
let g:goyo_margin_top = 2
let g:goyo_margin_bottom = 2
nnoremap <silent> <leader>z :Goyo<cr>

""""""""""""""""""""""""""""""
" => Quick Move and Select
""""""""""""""""""""""""""""""

"" => vim-multiple-cursors
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_start_word_key      = '<C-n>'
let g:multi_cursor_select_all_word_key = '<leader>n'
let g:multi_cursor_start_key           = 'g<C-n>'
let g:multi_cursor_select_all_key      = '<leader>gn'
let g:multi_cursor_next_key            = '<C-n>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'

" => easymotion
map <Leader><leader>l <Plug>(easymotion-lineforward)
map <Leader><leader>h <Plug>(easymotion-linebackward)

""""""""""""""""""""""""""""""
" => Program utilities
""""""""""""""""""""""""""""""

" Disabling highlighting
let g:ale_set_highlights = 0
" Only run linting when saving the file
" let g:ale_lint_on_text_changed = 'never'
" let g:ale_lint_on_enter = 0


""""""""""""""""""""""""""""""
" => Program language
""""""""""""""""""""""""""""""

" => Coc.nvim

let g:coc_global_extensions = ['coc-explorer', 'coc-git', 'coc-lists', 'coc-pairs', 'coc-yank', 'coc-highlight', 'coc-snippets', 'coc-json', 'coc-html', 'coc-tsserver', 'coc-css', 'coc-python', 'coc-eslint',  'coc-prettier']

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Give more space for displaying messages.
set cmdheight=2

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-x><c-o> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <leader>jd <Plug>(coc-definition)
nmap <leader>jt <Plug>(coc-type-definition)
nmap <leader>ji <Plug>(coc-implementation)
nmap <leader>ju <Plug>(coc-references)
nmap <leader>jr <Plug>(coc-rename)
nmap <leader>jf  <Plug>(coc-fix-current)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
"" Show all CoCList
nnoremap <silent><nowait> <space><space> :<C-u>CocList<cr>
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList snippets<cr>
" Yank
nnoremap <silent><nowait> <space>y  :<C-u>CocList yank<cr>
" File
nnoremap <silent><nowait> <space>f  :<C-u>CocList files<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

" => coc-git
nmap [h <Plug>(coc-git-prevchunk)
nmap ]h <Plug>(coc-git-nextchunk)
" show chunk diff at current position
nmap <leader>hh <Plug>(coc-git-chunkinfo)
nnoremap <leader>hf :CocCommand git.foldUnchanged<cr>
nnoremap <leader>hs :CocCommand git.chunkStage<cr>
nnoremap <leader>hu :CocCommand git.chunkUndo<cr>
nnoremap <leader>hd :CocCommand git.diffCached<cr>
nnoremap <leader>hc :CocCommand git.showCommit<cr>
noremap <silent> <leader>d :CocCommand git.toggleGutters<cr>

" create text object for git chunks
omap ih <Plug>(coc-git-chunk-inner)
xmap ih <Plug>(coc-git-chunk-inner)
omap ah <Plug>(coc-git-chunk-outer)
xmap ah <Plug>(coc-git-chunk-outer)

set statusline^=%{get(g:,'coc_git_status','')}%{get(b:,'coc_git_status','')}%{get(b:,'coc_git_blame','')}
nnoremap <silent> <space>g  :<C-u>CocList --normal gstatus<CR>
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" => coc-snippets
" Use <C-j> for trigger snippet expand.
imap <C-j> <Plug>(coc-snippets-expand)
" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)
" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coe_snippet_next = '<c-n>'
" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-p>'

nnoremap <F8> :Format<cr>
nmap <silent><F2> :CocCommand explorer<CR>

let g:ale_linters = {
\   'javascript': ['jshint'],
\   'python': ['pylint'],
\   'vue': ['eslint']
\}

let b:ale_fixers = {'javascript': ['prettier', 'eslint'], 'vue': 'vue-formatter'}
