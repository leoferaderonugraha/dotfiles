-- Async run command and show output in a new tab
function GetSystemOutputAsync(command)
    vim.cmd("new") -- or vim.cmd("vnew") for vertical split
    vim.bo.buftype = "nofile"
    vim.bo.bufhidden = "hide"
    vim.bo.swapfile = false

    local job_id = vim.fn.jobstart(command, {
        on_stdout = function(_, data)
            _Callback(job_id, data, "stdout")
        end,
        on_stderr = function(_, data)
            _Callback(job_id, data, "stderr")
        end,
        on_exit = function(_, data)
            _Callback(job_id, data, "exit")
        end
    })

    if job_id <= 0 then
        vim.cmd("normal iFailed to start job")
    end

    local new_win_id = vim.fn.win_getid()
    vim.fn.settabvar(vim.fn.tabpagenr(), "output_win_id", new_win_id)
end

function _Callback(job_id, data, event)
    if event == "stdout" then
        vim.fn.setline("$", data)
    elseif event == "stderr" then
        local err_len = #data - 1
        if err_len > 0 then
            vim.fn.setline("$", data[1])
            for i = 2, err_len do
                vim.fn.append(line("$"), data[i])
            end
        end
    elseif event == "exit" then
        vim.fn.append(line("$"), "Process exited with code " .. data)
    end
end

function _CallbackHandler(job_id, data, event)
    local cur_win_id = vim.fn.win_getid()
    local job_win_id = vim.fn.gettabvar(vim.fn.tabpagenr(), "output_win_id")

    if cur_win_id == job_win_id then
        _Callback(job_id, data, event)
    elseif cur_win_id ~= job_win_id then
        local is_window_open = vim.fn.win_gotoid(job_win_id)
        if is_window_open == 0 then
            if job_id then
                vim.fn.jobstop(job_id)
            end
            vim.fn.settabvar(vim.fn.tabpagenr(), "output_win_id", 0)
        else
            _Callback(job_id, data, event)
            vim.fn.win_gotoid(cur_win_id)
        end
    end
end

function ExecAsyncPrompt()
    local command = vim.fn.input("Spawn process: ")
    GetSystemOutputAsync(command)
end

vim.cmd("command! -nargs=1 ExecAsync lua GetSystemOutputAsync(<f-args>)")

-- Bindings
vim.api.nvim_set_keymap("n", "<Space>e", ":lua ExecAsyncPrompt()<CR>", { noremap = true })
