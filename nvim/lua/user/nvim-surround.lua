local status_ok, nvimsurround = pcall(require, "nvim-surround")
if not status_ok then
  return
end

nvimsurround.setup()
