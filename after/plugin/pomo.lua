require("pomo").setup({
    notifiers = {},
    sessions = {
        algs = {
            { name = "Work",  duration = "40m" },
            { name = "Break", duration = "5m" },
            { name = "Work",  duration = "40m" },
            { name = "Break", duration = "5m" },
            { name = "Work",  duration = "40m" },
            { name = "Break", duration = "15m" },
        },
        inf = {
            { name = "Work", duration = "1h" },
        },
        def = {
            { name = "Work", duration = "25m" },
        },
    },
})

local timer = "";
local isPause = true;

vim.keymap.set("n", "<Tab>f", function()
    timer = vim.fn.input("please enter pomodoro session ");
    isPause = false;
    vim.cmd('TimerSession ' .. timer)
end)

vim.keymap.set("n", "<Tab>n", function()
    if isPause == true then
        vim.cmd("TimerResume 1")
        isPause = false;
    else
        vim.cmd("TimerPause 1")
        isPause = true
    end
end)

vim.keymap.set("n", "<Tab>m", function()
    vim.cmd("TimerStop 1")
end)
