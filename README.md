# lazy_on_func.nvim

This is a plugin for performing delayed plugin loading from functions, utilizing [lazy.nvim](https://github.com/folke/lazy.nvim).

## Usage

To invoke a plugin function, you will need to use `on_func` to generate an interface that will facilitate the function's deferred loading. The function's parameters consist of the plugin name, which forms the first argument, and the prefix of the autoload function name as the second argument.

The function returned by `on_func` is a higher-order function. It can be executed by providing the function name as the first argument and the parameters for the function as the second argument.


```lua
local on_func = require('lazy_on_func.nvim').on_func
```

### Use with [searchx](https://github.com/hrsh7th/vim-searchx)

```lua
return {
  {
    'hrsh7th/vim-searchx',
    lazy = true,
    init = function()
      local on_func = require('lazy_on_func').on_func
      local searchx = on_func('vim-searchx', 'searchx')

      vim.keymap.set({ 'n', 'x' }, '/', function()
        searchx('start')({ dir = 1 })
      end)
      vim.keymap.set({ 'n', 'x' }, '?', function()
        searchx('start')({ dir = 0 })
      end)
      vim.keymap.set({ 'c' }, ';', function()
        searchx('select')()
      end)

      vim.keymap.set({ 'n', 'x' }, 'N', function()
        searchx('prev_dir')()
      end)
      vim.keymap.set({ 'n', 'x' }, 'n', function()
        searchx('next_dir')()
      end)

      -- ...
    end,
  },
}
```

### Special Thanks

[@delphinus](https://github.com/delphinus)
