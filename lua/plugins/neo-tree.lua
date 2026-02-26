-- Customize Neo-tree file explorer

---@type LazySpec
return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    event_handlers = {
      {
        event = "file_opened",
        handler = function() require("neo-tree.command").execute { action = "close" } end,
      },
    },
    filesystem = {
      filtered_items = {
        hide_dotfiles = false,
      },
    },
    window = {
      position = "float",
      width = 50,
    },
  },
}
