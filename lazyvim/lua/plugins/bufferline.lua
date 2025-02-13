return {
  "akinsho/bufferline.nvim",
  opts = {
    options = {
      custom_filter = function(buf_number, buf_numbers)
        if vim.bo[buf_number].buftype ~= "terminal" then
          return true
        end
      end,
    },
  },
}
