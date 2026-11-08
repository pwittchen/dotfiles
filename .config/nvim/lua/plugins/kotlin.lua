-- kotlin-language-server crashes when init_options is empty: Neovim encodes `{}`
-- as a JSON array, but the server expects an object. Passing storagePath fixes it.
return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      kotlin_language_server = {
        init_options = {
          storagePath = vim.fn.stdpath("cache") .. "/kotlin_language_server",
        },
      },
    },
  },
}
