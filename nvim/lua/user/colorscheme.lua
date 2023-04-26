local status_ok, colour = pcall(require, "github-theme")
if not status_ok then
  return
end


local setup = {
  vim.cmd('colorscheme github_dark')
}

colour.setup(setup)
