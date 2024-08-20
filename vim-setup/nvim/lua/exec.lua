-- execute command with neovim's terminal emulator feature
function ExecCommand()
    local command = vim.fn.input("Spawn process: ")
    vim.cmd("vnew term://" .. command)
    -- vim.bo.buftype = "nofile"
    vim.bo.bufhidden = "hide"
    vim.bo.swapfile = false

    local new_win_id = vim.fn.win_getid()
    vim.fn.settabvar(vim.fn.tabpagenr(), "output_win_id", new_win_id)
end

vim.cmd("command! ExecCommand lua ExecCommand()")

-- Bindings
vim.api.nvim_set_keymap("n", "<Space>r", ":lua ExecCommand()<CR>", { noremap = true })
