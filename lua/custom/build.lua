local uv = vim.loop

local M = {}

local function current_buffer_dir()
  local bufname = vim.api.nvim_buf_get_name(0)
  if bufname == '' then
    return uv.cwd() or vim.fn.getcwd()
  end
  return vim.fs.dirname(bufname)
end

local function find_nearest_csproj()
  local start_dir = current_buffer_dir()
  local matches = vim.fs.find(function(name, path)
    return path and name:match('%.csproj$') ~= nil
  end, { path = start_dir, upward = true, stop = uv.os_homedir() })

  return matches and matches[1] or nil
end

function M.build_nearest_godot_project()
  local csproj = find_nearest_csproj()
  if not csproj then
    vim.notify('No .csproj file found when searching upward from the current buffer.', vim.log.levels.ERROR)
    return
  end

  vim.notify('Building ' .. csproj .. ' ...', vim.log.levels.INFO)
  local output = vim.fn.systemlist({ 'dotnet', 'build', csproj })
  if not output or #output == 0 then
    output = { 'dotnet build produced no output.' }
  end

  vim.fn.setqflist({}, ' ', { title = 'dotnet build (' .. csproj .. ')', lines = output })

  if vim.v.shell_error ~= 0 then
    vim.notify('Godot build failed for ' .. csproj, vim.log.levels.ERROR)
    vim.cmd('copen')
  else
    vim.notify('Godot build succeeded for ' .. csproj, vim.log.levels.INFO)
  end
end

return M
