local curl = require "plenary.curl"

local M = {}

local base_url = "https://api.binance.com/api/v3"

M._format_pric_string = function(data)
  local price = tonumber(data.lastPrice)
  local change = tonumber(data.priceChangePercent)
  local chart = change < 0 and "📉" or "📈"
  local changetext = "% 24hr change"
  local text = "%s %s %0.2f | %0.1f%s"
  return string.format(text, chart, data.symbol, price, change, changetext)
end

M.get_price = function(symbol)
  -- /ticker/24hr
  local url = "%s/ticker/24hr?symbol=%sUSDT"
  local res =  curl.request({
    url=string.format(url, base_url, symbol),
    method="get"
  })

  print(vim.inspect(res))
  local code = res.status
  local data = vim.fn.json_decode(res.body)

  return {code=code, data=M._format_pric_string(data)}
end

return M
