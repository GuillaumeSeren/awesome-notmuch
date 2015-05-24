-- ---------------------------------------------
-- Notmuch Widget for Awesome WM
-- @author Guillaume Seren
-- source  https://github.com/GuillaumeSeren/awesome-notmuch
-- file    init.lua
-- Licence GPLv3
--
-- Main Notmuch widget lib.
-- ---------------------------------------------

-- Rfkill Widget Class
notmuchWidget = {}

-- Check if the dependencies needed by mailWidget is here
function notmuchWidget.getValid()
    -- We need notmuch command
    local output = nil
    local notmuchStatusCmd = os.execute("which notmuch")
    if notmuchStatusCmd ~= 0 then
        output = nil
    else
        output = notmuchStatusCmd
    end
    return output
end

-- Return mail icon & status
function notmuchWidet.getInboxStatus()
    local mailStatusCmd = io.popen("notmuch count INBOX")
    local mailStatusValue = mailStatusCmd:read()
    mailStatusCmd:close()
    local output = ""
    if tonumber(mailStatusValue) > 0 then
        output = "M "..mailStatusValue
    else
        output = "M 0"
    end
    return blue .. output .. coldef
end

return notmuchWidget
