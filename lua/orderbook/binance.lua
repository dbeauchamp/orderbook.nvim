local curl = require "plenary.curl"

local M = {}

local base_url = "https://api.binance.com/api/v3"

M.get_price = function(symbol)
  -- /ticker/24hr
  local url = ("%s/ticker/24hr?symbol=%sUSDT")
  local res =  curl.request({
    url=string.format(url, base_url, symbol),
    method="get"
  })

  local data = vim.fn.json_decode(res.body)
  return data.askPrice
end

return M
