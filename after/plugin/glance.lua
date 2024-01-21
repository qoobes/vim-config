local glance = require("glance")

local function filter(arr, fn)
  if type(arr) ~= "table" then
    return arr
  end

  local filtered = {}
  for k, v in pairs(arr) do
    if fn(v, k, arr) then
      table.insert(filtered, v)
    end
  end

  return filtered
end

local function filterReactDTS(value)
  if value.uri then
    return string.match(value.uri, "%.d.ts") == nil and string.match(value.uri, "node_modules") == nil
  elseif value.targetUri then
    return string.match(value.targetUri, "%.d.ts") == nil and string.match(value.targetUri, "node_modules") == nil
  end

  return true
end

glance.setup({
  hooks = {
    before_open = function(results, open, jump, method)
      local newResults = filter(results, filterReactDTS)

      if #newResults == 1 then
        jump(newResults[1]) -- argument is optional
      else
        open(newResults) -- argument is optional
      end
    end,
  },
})
