local max_notches =  14
local wibox = require("wibox")
local awful = require("awful")
 
local volume_widget = wibox.widget.textbox()
volume_widget:set_align("right")
 
function update_volume(widget)
   local fd = io.popen("amixer sget Master")
   local status = fd:read("*all")
   fd:close()
 
    local volume = tonumber(string.match(status, "(%d?%d?%d)%%")) / 100
    local notches = math.floor(max_notches * volume)

    -- starting colour
    local sr, sg, sb = 0xFF, 0x33, 0x33
    -- ending colour
    local er, eg, eb = 0x11, 0x55, 0x11

    local ir = volume * (er - sr) + sr
    local ig = volume * (eg - sg) + sg
    local ib = volume * (eb - sb) + sb
    local display = ' +['
    interpol_colour = string.format("%.2x%.2x%.2x", ir, ig, ib)

    -- Match notch number to ascii art
    for i=notches+1, max_notches do
      display = display .. ' '
    end
    for i=1,notches do
      display = display .. '|'
    end
    display = display .. ']-'

    if string.find(status, "on", 1, true) then
      display = " <span background='#" .. interpol_colour .. "'>" .. display .. "</span>"
    else
      display = " <span color='red' background='#" .. interpol_colour .. "'>" .. display .. "</span>"
    end

    widget:set_markup(display)
end
 
update_volume(volume_widget)
 
module = {}
module.widget = volume_widget
module.update = function () update_volume(volume_widget) end

return module
