local mason_packages_to_install = {}

local install_packages_delay_timeout = 500
vim.defer_fn(function()
  require("mason").setup()
  local registry = require("mason-registry")
  registry.refresh(function()
    for _, name in pairs(mason_packages_to_install) do
      if registry.has_package(name) and not registry.is_installed(name) then
        registry.get_package(name):install()
      end
    end
  end)
end, install_packages_delay_timeout)

return {
  install_mason_packages = function(names)
    for _, name in pairs(names) do
      table.insert(mason_packages_to_install, name)
    end
  end,
}

