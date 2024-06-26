local M = {}

---@return boolean
local function is_active()
  ---@type boolean, any
  local ok, cmp = pcall(require, 'cmp')
  if not ok then
    return false
  end
  ---@type table
  local entries = cmp.get_entries()
  return vim.tbl_count(entries) > 0
end

local function register_source()
  ---@type boolean, any
  local ok, cmp = pcall(require, 'cmp')
  if not ok then
    return
  end
  cmp.register_source('fittencode', require('fittencode.sources.cmp.source'):new())
end

---@param value? boolean
local function silence(value)
  local ok, config = pcall(require, 'cmp.config')
  if not ok then
    return
  end
  local opts = {}
  if value == nil or value == true then
    opts = { enabled = false }
  end
  config.set_onetime(opts)
end

function M.setup()
  register_source()
end

return M
