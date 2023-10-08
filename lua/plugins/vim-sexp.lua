return {
  'tpope/vim-sexp-mappings-for-regular-people',
  lazy = false,
  dependencies = {
    'guns/vim-sexp',
    'tpope/vim-repeat',
    'tpope/vim-surround'
  },
  init = function ()
    vim.cmd([[ let g:sexp_filetypes = 'clojure,scheme,lisp,timl,hy,fennel,janet' ]])
  end
}
