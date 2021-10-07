local clangd = {
    name = nil,
    builddir = 'build'
}

function clangd.setkeymap()
    local params = { noremap = true, silent = true }

    vim.api.nvim_buf_set_keymap('n', '', '<leader>cf', '<cmd>!g++ % -o exec && ./exec<CR>', params)
    if clangd.setcmake() then
        print('CMakeLists.txt not detected!')
    else
        vim.api.nvim_buf_set_keymap('n', '', '<leader>cp', "<cmd>make -C " .. clangd.builddir .. "<CR>", params)
	vim.api.nvim_buf_set_keymap('n', '', '<leader>r', '<cmd>!./build/' .. clangd.name .. '<CR>', params)
    end
end

function clangd.setcmake()
    local cmake_lists = io.open('CMakeLists.txt', 'r')
    if not cmake_lists then return 1 end

    local content = cmake_lists:read('*all')
    clangd.name = string.match(content:match('project%(%w+'), '%(%w+'):sub(2, -1)
    cmake_lists:close()

    if not os.rename(clangd.builddir, clangd.builddir) then
        vim.cmd('silent !mkdir ' .. clangd.builddir)
    end

    vim.cmd('silent !cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=ON -B ' .. clangd.builddir)
end

return clangd
