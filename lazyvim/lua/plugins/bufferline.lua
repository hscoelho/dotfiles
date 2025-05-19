return {
  "akinsho/bufferline.nvim",
  opts = {
    options = {
      custom_filter = function(buf_number, buf_numbers)
        if vim.bo[buf_number].buftype ~= "terminal" then
          return true
        end
      end,
      sort_by = function(buffer_a, buffer_b)
        local info_a = vim.fn.getbufinfo(buffer_a.id)[1]
        local info_b = vim.fn.getbufinfo(buffer_b.id)[1]
        return info_a.lastused > info_b.lastused
      end,
    },
  },
}
