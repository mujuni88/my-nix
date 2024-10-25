require("dressing").setup({
  input = {
    enabled = true,
    default_prompt = "  Input: ",
    highlight = "Comment",
    respect_cwd = true,
    respect_root = true,
    get_prompt = function()
      return "  Input: "
    end,
  }
})
