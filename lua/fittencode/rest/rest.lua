---@class Rest
---@field impl_name string
local M = {}

---@param impl_name? string
function M:new(impl_name)
  local obj = {
    impl_name = impl_name,
  }
  self.__index = self
  return setmetatable(obj, self)
end

function M:get_implementation_name()
  return self.impl_name
end

function M:get(url, headers, data, on_success, on_error)
end

function M:post(url, headers, data, on_success, on_error)
end

return M
