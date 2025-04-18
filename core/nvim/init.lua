-- This file simply bootstraps the installation of Lazy.nvim and then calls other files for execution
-- This file doesn't necessarily need to be touched, BE CAUTIOUS editing this file and proceed at your own risk.
local lazypath = vim.env.LAZY or vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not (vim.env.LAZY or (vim.uv or vim.loop).fs_stat(lazypath)) then
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(lazypath)

-- validate that lazy is available
if not pcall(require, "lazy") then
  -- stylua: ignore
  vim.api.nvim_echo({ { ("Unable to load lazy from: %s\n"):format(lazypath), "ErrorMsg" }, { "Press any key to exit...", "MoreMsg" } }, true, {})
  vim.fn.getchar()
  vim.cmd.quit()
end

-- Dist Specific
local os_env = vim.fn.getenv "OS"

if os_env == "Windows" then
  local shell = vim.fn.executable "pwsh" == 1 and "pwsh" or "powershell"
  vim.opt.shell = shell
  vim.opt.shellcmdflag =
    "-ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8; "
  vim.opt.shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait"
  vim.opt.shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode"
  vim.opt.shellquote = ""
  vim.opt.shellxquote = ""
else
  vim.opt.shell = "/bin/zsh"
end

-- for rest nvim formatting with jq. For powershell, if noshelltemp is not off, then tmp files make it so jq fails.
vim.api.nvim_set_option_value("shelltemp", false, {})
vim.api.nvim_create_autocmd("FileType", {
  pattern = "json",
  -- use the -b to convert to binary to fix the windows ^M issue
  callback = function(ev) vim.bo[ev.buf].formatprg = "jq -b ." end,
})

require "lazy_setup"
require "polish"
