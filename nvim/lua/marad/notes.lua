local Notes = {}

local note_paths = "~/notes"
local daily_template = "daily_template.md"


--local function file_exists(file_name)
--    local f = io.open(file_name, "r")
--    local exists = f ~= nil
--    io.close(f)
--    return exists
--end

local function is_daily_file(file_path)
    return string.match(file_path, "^(.*%d+-%d+-)(%d+).md$") ~= nil
end

local function get_todays_daily_file()
    return note_paths .. "/" .. os.date("%Y-%m-%d") .. ".md"
end

local function get_opened_or_todays_daily_file()
    local bufname = vim.fn.bufname("%")
    if is_daily_file(bufname) then
        return bufname
    else
        return get_todays_daily_file()
    end
end

local function open_and_cwd(path)
    vim.cmd("lcd " .. note_paths)
    vim.cmd("e " .. path)
end

function Notes.open_daily_note()
    open_and_cwd(get_todays_daily_file())
    -- TODO: use some templating library
    --local template = note_path .. "/" .. daily_template
    --if not file_exists(daily_file) and file_exists(template) then
    --    vim.cmd("r " .. template)
    --end
end

function Notes.next_daily_note()
    local bufname = get_opened_or_todays_daily_file()
    local path, y, m, d = string.match(bufname, "^(.*)(%d+)-(%d+)-(%d+).md$")
    local day_before = os.time { year = y, month = m, day = d } + (3600 * 24)
    local file = path .. os.date("%Y-%m-%d", day_before) .. ".md"
    open_and_cwd(file)
end

function Notes.previous_daily_note()
    local bufname = get_opened_or_todays_daily_file()
    local path, y, m, d = string.match(bufname, "^(.*)(%d+)-(%d+)-(%d+).md$")
    local day_before = os.time { year = y, month = m, day = d } - (3600 * 24)
    local file = path .. os.date("%Y-%m-%d", day_before) .. ".md"
    open_and_cwd(file)
end

function Notes.setup()

    local wk = require("which-key")
    wk.add({
        {"<leader>f", desc = "Notes"},
        {"<leader>ff", desc = {"<cmd>Telescope find_files<CR>", "Find note"}},
        {"<leader>fd", desc = {Notes.open_daily_note, "Open daily note"}},
        {"<leader>fp", desc = {Notes.previous_daily_note, "Open previous daily note"}},
        {"<leader>fn", desc = {Notes.next_daily_note, "Open next daily note"}},
    })
end

function Notes.reload()
    package.loaded["marad.notes"] = nil
    require("marad.notes").setup()
    vim.notify("Reloaded!")
end

return Notes
