require("Comment").setup {
  padding = true,
  sticky = true,

  -- comment jsx/tsx
  pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
}
