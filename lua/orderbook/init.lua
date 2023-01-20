local b = require "orderbook.binance"

local M = {}

-- need user to supply api key for user api endpoints
M.setup = function(opts)
  -- quote currency setup?
end

M.price = function()
  vim.ui.input({
    prompt = "Price: ",
    default = "",
    completion = nil,
  }, function(symbol)
    if symbol then
      local price = b.get_price(string.upper(symbol))
      console.clear()
      print(vim.inspect(price))
    else
      return
    end
  end)
end

return M
