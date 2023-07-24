local M = {}

---@param plugin_name string
---@param prefix string
---@return fun (name: string): fun (opt: any | nil): any
M.on_func = function(plugin_name, prefix)
  return function(name)
    require('lazy').load({ plugins = plugin_name })
    local f = vim.fn[prefix .. '#' .. name]
    return function(opt)
      return opt and f(opt) or f()
    end
  end
end

return M
