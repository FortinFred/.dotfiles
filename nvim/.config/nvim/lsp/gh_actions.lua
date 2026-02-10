local function get_gh_actions_init_options()
  return {
    settings = {
      githubActions = {
        workflowValidation = {
          enabled = true,
        },
        openApiValidation = {
          enabled = true,
        },
      }
    },
    capabilities = {
      workspace = {
        didChangeWorkspaceFolders = {
          dynamicRegistration = true,
        },
      },
    }
  }
end

local handlers = {
  ['actions/readFile'] = function(_, result)
    if type(result.path) ~= 'string' then 
      return nil, { code = -32602, message = 'Invalid path parameter' }
    end
    local file_path = vim.uri_to_fname(result.path)
    if vim.fn.filereadable(file_path) == 1 then 
      local f = assert(io.open(file_path, 'rb'))
      local content = f:read('*all')
      f:close()
      return content
    else
      return nil, { code = -32602, message = 'File not found: ' .. file_path }
    end
  end,
}

return {
  cmd = { 'gh-actions-language-server', '--stdio' },
  filetypes = { 'yaml.github' },
  init_options = get_gh_actions_init_options(),
  handlers = handlers,
  single_file_support = true,
  root_dir = function(bufnr, on_dir)
    local parent = vim.fs.dirname(vim.api.nvim_buf_get_name(bufnr))
    if vim.endswith(parent, '/.github/workflows') then
      on_dir(parent)
    end
  end,
}