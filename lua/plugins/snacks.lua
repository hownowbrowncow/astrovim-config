-- Customize Snacks picker behaviour

---@type LazySpec
return {
  "folke/snacks.nvim",
  opts = {
    picker = {
      formatters = {
        file = {
          filename_first = true, -- show filename before directory path
        },
      },
      sources = {
        files = {
          preview = false, -- no code preview when searching files by name
        },
        smart = {
          preview = false, -- same for smart finder (buffers/recent/files)
        },
      },
    },
  },
}
