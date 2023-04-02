--[[
    Credits

    hexarobi - huge help with the file part
]]

util.ensure_package_is_installed('lua/inspect')
local inspect = require("inspect")

if not filesystem.exists(filesystem.resources_dir().."\\theme_loader") then
    filesystem.mkdir(filesystem.resources_dir().."\\theme_loader")
end
if not filesystem.exists(filesystem.resources_dir().."\\theme_loader\\themes") then
    filesystem.mkdir(filesystem.resources_dir().."\\theme_loader\\themes")
end

local themelist = menu.list(menu.my_root(), "Themes", {"themelist"}, "", function(); end)
menu.action(themelist, "Open Folder", {}, "", function()
    util.open_folder(filesystem.resources_dir().."\\theme_loader\\themes")
end)

local theme_data = {
    {path = "Stand>Settings>Appearance>Max Visible Commands", value = 0},
    {path = "Stand>Settings>Appearance>List Width", value = 0},
    {path = "Stand>Settings>Appearance>List Height", value = 0},
    {path = "Stand>Settings>Appearance>Spacer Size", value = 0},
    {path = "Stand>Settings>Appearance>Smooth Scrolling", value = 0},
    {path = "Stand>Settings>Appearance>Background Blur", value = 0},
    {path = "Stand>Settings>Appearance>Stream-Proof Rendering", value = false},
    {path = "Stand>Settings>Appearance>Disable Entity Previews", value = false},
    {path = "Stand>Settings>Appearance>Colours>Primary Colour>Rainbow Mode", value = 0},
    {path = "Stand>Settings>Appearance>Colours>Primary Colour>Opacity", value = 0},
    {path = "Stand>Settings>Appearance>Colours>Primary Colour>Red", value = 0},
    {path = "Stand>Settings>Appearance>Colours>Primary Colour>Green", value = 0},
    {path = "Stand>Settings>Appearance>Colours>Primary Colour>Blue", value = 0},
    {path = "Stand>Settings>Appearance>Colours>Focused Text Colour>Opacity", value = 0},
    {path = "Stand>Settings>Appearance>Colours>Focused Text Colour>Red", value = 0},
    {path = "Stand>Settings>Appearance>Colours>Focused Text Colour>Green", value = 0},
    {path = "Stand>Settings>Appearance>Colours>Focused Text Colour>Blue", value = 0},
    {path = "Stand>Settings>Appearance>Colours>Focused Right-Bound Text Colour>Opacity", value = 0},
    {path = "Stand>Settings>Appearance>Colours>Focused Right-Bound Text Colour>Red", value = 0},
    {path = "Stand>Settings>Appearance>Colours>Focused Right-Bound Text Colour>Green", value = 0},
    {path = "Stand>Settings>Appearance>Colours>Focused Right-Bound Text Colour>Blue", value = 0},
    {path = "Stand>Settings>Appearance>Colours>Focused Texture Colour>Opacity", value = 0},
    {path = "Stand>Settings>Appearance>Colours>Focused Texture Colour>Red", value = 0},
    {path = "Stand>Settings>Appearance>Colours>Focused Texture Colour>Green", value = 0},
    {path = "Stand>Settings>Appearance>Colours>Focused Texture Colour>Blue", value = 0},
    {path = "Stand>Settings>Appearance>Colours>Background Colour>Opacity", value = 0},
    {path = "Stand>Settings>Appearance>Colours>Background Colour>Red", value = 0},
    {path = "Stand>Settings>Appearance>Colours>Background Colour>Green", value = 0},
    {path = "Stand>Settings>Appearance>Colours>Background Colour>Blue", value = 0},
    {path = "Stand>Settings>Appearance>Colours>Unfocused Text Colour>Opacity", value = 0},
    {path = "Stand>Settings>Appearance>Colours>Unfocused Text Colour>Red", value = 0},
    {path = "Stand>Settings>Appearance>Colours>Unfocused Text Colour>Green", value = 0},
    {path = "Stand>Settings>Appearance>Colours>Unfocused Text Colour>Blue", value = 0},
    {path = "Stand>Settings>Appearance>Colours>Unfocused Right-Bound Text Colour>Opacity", value = 0},
    {path = "Stand>Settings>Appearance>Colours>Unfocused Right-Bound Text Colour>Red", value = 0},
    {path = "Stand>Settings>Appearance>Colours>Unfocused Right-Bound Text Colour>Green", value = 0},
    {path = "Stand>Settings>Appearance>Colours>Unfocused Right-Bound Text Colour>Blue", value = 0},
    {path = "Stand>Settings>Appearance>Colours>Unfocused Texture Colour>Opacity", value = 0},
    {path = "Stand>Settings>Appearance>Colours>Unfocused Texture Colour>Red", value = 0},
    {path = "Stand>Settings>Appearance>Colours>Unfocused Texture Colour>Green", value = 0},
    {path = "Stand>Settings>Appearance>Colours>Unfocused Texture Colour>Blue", value = 0},
    {path = "Stand>Settings>Appearance>Colours>HUD Colour>Rainbow Mode", value = 0},
    {path = "Stand>Settings>Appearance>Colours>HUD Colour>Opacity", value = 0},
    {path = "Stand>Settings>Appearance>Colours>HUD Colour>Red", value = 0},
    {path = "Stand>Settings>Appearance>Colours>HUD Colour>Green", value = 0},
    {path = "Stand>Settings>Appearance>Colours>HUD Colour>Blue", value = 0},
    {path = "Stand>Settings>Appearance>Colours>AR Colour>Rainbow Mode", value = 0},
    {path = "Stand>Settings>Appearance>Colours>AR Colour>Opacity", value = 0},
    {path = "Stand>Settings>Appearance>Colours>AR Colour>Red", value = 0},
    {path = "Stand>Settings>Appearance>Colours>AR Colour>Green", value = 0},
    {path = "Stand>Settings>Appearance>Colours>AR Colour>Blue", value = 0},
    {path = "Stand>Settings>Appearance>Colours>Minigame Colour>Rainbow Mode", value = 0},
    {path = "Stand>Settings>Appearance>Colours>Minigame Colour>Opacity", value = 0},
    {path = "Stand>Settings>Appearance>Colours>Minigame Colour>Red", value = 0},
    {path = "Stand>Settings>Appearance>Colours>Minigame Colour>Green", value = 0},
    {path = "Stand>Settings>Appearance>Colours>Minigame Colour>Blue", value = 0},
    {path = "Stand>Settings>Appearance>Position>X", value = 0},
    {path = "Stand>Settings>Appearance>Position>Y", value = 0},
    {path = "Stand>Settings>Appearance>Position>Move With Mouse", value = false},
    {path = "Stand>Settings>Appearance>Max Visible Commands", value = 0},
    {path = "Stand>Settings>Appearance>List Width", value = 0},
    {path = "Stand>Settings>Appearance>List Height", value = 0},
    {path = "Stand>Settings>Appearance>Address Bar>Address Bar", value = false},
    {path = "Stand>Settings>Appearance>Address Bar>Root Name", value = 0},
    {path = "Stand>Settings>Appearance>Address Bar>Address Separator", value = 0},
    {path = "Stand>Settings>Appearance>Address Bar>Show Current List Only", value = false},
    {path = "Stand>Settings>Appearance>Address Bar>Width Affected By Scrollbar", value = false},
    {path = "Stand>Settings>Appearance>Address Bar>Height", value = 0},
    {path = "Stand>Settings>Appearance>Address Bar>Show Cursor Position", value = false},
    {path = "Stand>Settings>Appearance>Address Bar>Cursor Position Includes Dividers", value = false},
    {path = "Stand>Settings>Appearance>Address Bar>Text>Scale", value = 0},
    {path = "Stand>Settings>Appearance>Address Bar>Text>X Offset", value = 0},
    {path = "Stand>Settings>Appearance>Address Bar>Text>Y Offset", value = 0},
    {path = "Stand>Settings>Appearance>Cursor>Scroll Gap", value = 0},
    {path = "Stand>Settings>Appearance>Cursor>Width", value = 0},
    {path = "Stand>Settings>Appearance>Cursor>Rounded", value = false},
    {path = "Stand>Settings>Appearance>Cursor>Colour>Rainbow Mode", value = 0},
    {path = "Stand>Settings>Appearance>Cursor>Colour>Opacity", value = 0},
    {path = "Stand>Settings>Appearance>Cursor>Colour>Red", value = 0},
    {path = "Stand>Settings>Appearance>Cursor>Colour>Green", value = 0},
    {path = "Stand>Settings>Appearance>Cursor>Colour>Blue", value = 0},
    {path = "Stand>Settings>Appearance>Tabs>Tabs", value = false},
    {path = "Stand>Settings>Appearance>Tabs>Width", value = 0},
    {path = "Stand>Settings>Appearance>Tabs>Height", value = 0},
    {path = "Stand>Settings>Appearance>Tabs>Position", value = 0},
    {path = "Stand>Settings>Appearance>Tabs>Text Alignment", value = 0},
    {path = "Stand>Settings>Appearance>Tabs>Show Icon Left", value = false},
    {path = "Stand>Settings>Appearance>Tabs>Show Name", value = false},
    {path = "Stand>Settings>Appearance>Tabs>Show Icon Right", value = false},
    {path = "Stand>Settings>Appearance>Tabs>Icons Use Text Colour", value = false},
    {path = "Stand>Settings>Appearance>Tabs>Text>Scale", value = 0},
    {path = "Stand>Settings>Appearance>Tabs>Text>X Offset", value = 0},
    {path = "Stand>Settings>Appearance>Tabs>Text>Y Offset", value = 0},
    {path = "Stand>Settings>Appearance>Scrollbar>Scrollbar", value = 0},
    {path = "Stand>Settings>Appearance>Scrollbar>Width", value = 0},
    {path = "Stand>Settings>Appearance>Command Info Text>Position", value = 0},
    {path = "Stand>Settings>Appearance>Command Info Text>Width", value = 0},
    {path = "Stand>Settings>Appearance>Command Info Text>Padding", value = 0},
    {path = "Stand>Settings>Appearance>Command Info Text>Show Help Text", value = false},
    {path = "Stand>Settings>Appearance>Command Info Text>Show Command Syntax", value = false},
    {path = "Stand>Settings>Appearance>Command Info Text>Indicate Slider Behaviour", value = false},
    {path = "Stand>Settings>Appearance>Command Info Text>Indicate If Usable By Other Players", value = false},
    {path = "Stand>Settings>Appearance>Notifications>Type", value = 0},
    {path = "Stand>Settings>Appearance>Notifications>Invert Flow", value = false},
    {path = "Stand>Settings>Appearance>Notifications>Width", value = 0},
    {path = "Stand>Settings>Appearance>Notifications>Custom Position>X", value = 0},
    {path = "Stand>Settings>Appearance>Notifications>Custom Position>Y", value = 0},
    {path = "Stand>Settings>Appearance>Notifications>Custom Position>Move With Mouse", value = false},
    {path = "Stand>Settings>Appearance>Notifications>Border Colour>Rainbow Mode", value = 0},
    {path = "Stand>Settings>Appearance>Notifications>Border Colour>Opacity", value = 0},
    {path = "Stand>Settings>Appearance>Notifications>Border Colour>Red", value = 0},
    {path = "Stand>Settings>Appearance>Notifications>Border Colour>Green", value = 0},
    {path = "Stand>Settings>Appearance>Notifications>Border Colour>Blue", value = 0},
    {path = "Stand>Settings>Appearance>Notifications>Flash Colour>Rainbow Mode", value = 0},
    {path = "Stand>Settings>Appearance>Notifications>Flash Colour>Opacity", value = 0},
    {path = "Stand>Settings>Appearance>Notifications>Flash Colour>Red", value = 0},
    {path = "Stand>Settings>Appearance>Notifications>Flash Colour>Green", value = 0},
    {path = "Stand>Settings>Appearance>Notifications>Flash Colour>Blue", value = 0},
    {path = "Stand>Settings>Appearance>Notifications>Background Colour>Opacity", value = 0},
    {path = "Stand>Settings>Appearance>Notifications>Background Colour>Red", value = 0},
    {path = "Stand>Settings>Appearance>Notifications>Background Colour>Green", value = 0},
    {path = "Stand>Settings>Appearance>Notifications>Background Colour>Blue", value = 0},
    {path = "Stand>Settings>Appearance>Commands>Selectable Dividers", value = false},
    {path = "Stand>Settings>Appearance>Commands>Text>Scale", value = 0},
    {path = "Stand>Settings>Appearance>Commands>Text>X Offset", value = 0},
    {path = "Stand>Settings>Appearance>Commands>Text>Y Offset", value = 0},
    {path = "Stand>Settings>Appearance>Commands>Colour Commands>Preview Colour In Texture", value = false},
    {path = "Stand>Settings>Appearance>Commands>Colour Commands>Preview Colour In List", value = false},
    {path = "Stand>Settings>Appearance>Commands>Prefill Current Value For Command Box>Sliders", value = false},
    {path = "Stand>Settings>Appearance>Commands>Prefill Current Value For Command Box>Text Inputs", value = false},
    {path = "Stand>Settings>Appearance>Commands>Number Sliders>Selectable N/A Sliders", value = false},
    {path = "Stand>Settings>Appearance>Commands>Number Sliders>Rightbound Value", value = false},
    {path = "Stand>Settings>Appearance>Border>Width", value = 0},
    {path = "Stand>Settings>Appearance>Border>Rounded", value = false},
    {path = "Stand>Settings>Appearance>Border>Colour>Rainbow Mode", value = 0},
    {path = "Stand>Settings>Appearance>Border>Colour>Opacity", value = 0},
    {path = "Stand>Settings>Appearance>Border>Colour>Red", value = 0},
    {path = "Stand>Settings>Appearance>Border>Colour>Green", value = 0},
    {path = "Stand>Settings>Appearance>Border>Colour>Blue", value = 0},
    {path = "Stand>Settings>Appearance>Font & Text>Command Box Input Text>Scale", value = 0},
    {path = "Stand>Settings>Appearance>Font & Text>Command Box Input Text>X Offset", value = 0},
    {path = "Stand>Settings>Appearance>Font & Text>Command Box Input Text>Y Offset", value = 0},
    {path = "Stand>Settings>Appearance>Font & Text>Small Text>Scale", value = 0},
    {path = "Stand>Settings>Appearance>Font & Text>Small Text>X Offset", value = 0},
    {path = "Stand>Settings>Appearance>Font & Text>Small Text>Y Offset", value = 0},
    {path = "Stand>Settings>Appearance>Font & Text>Show Text Bounding Boxes", value = false},
    {path = "Stand>Settings>Appearance>Textures>Leftbound", value = false},
}

local function CopyData(data_table)
	for index, _ in ipairs(data_table) do
        data_table[index].value = menu.get_value(menu.ref_by_path(data_table[index].path))
    end
end
local function SetData(data_table)
	for index, _ in ipairs(data_table) do
        data_table[index].value = menu.set_value(menu.ref_by_path(data_table[index].path), data_table[index].value)
    end
end
local function ReadTheme(themename)
    local filepath = filesystem.resources_dir().."\\theme_loader\\themes\\"..themename..".json"
    local file, err = io.open(filepath, "r")
    if file then
        local status, data = pcall(function() return file:read("*a") end)
        if not status then
            util.toast("Invalid theme name "..themename, TOAST_ALL)
            return
        end
        file:close()
        return data
    else
        error("Could not read theme '"..themename.."': " .. err, TOAST_ALL)
    end
end
local function WriteTheme(themename, object)
    local filepath = filesystem.resources_dir().."\\theme_loader\\themes\\"..themename..".json"
    local encode_status, content = pcall(soup.json.encode, object)
    if not encode_status then
        util.toast("Error encoding object: "..content)
        util.log("Error encoding object: "..content.." object: "..inspect(object))
    end
    if content == "" or (not string.startswith(content, "[")) then
       util.toast("Cannot save object as JSON: Error serializing", TOAST_ALL)
       return
    end

    local file = io.open(filepath, "wb")
    if not file then error("Cannot write to file " .. filepath, TOAST_ALL) end
    file:write(content)
    file:close()
end

menu.action(menu.my_root(), "Load Theme", {"themeload"}, "", function() menu.show_command_box("themeload ") end, function(themename)
	SetData(soup.json.decode(ReadTheme(themename)))
end)
menu.action(menu.my_root(), "Save Theme", {"themesave"}, "", function() menu.show_command_box("themesave ") end, function(themename)
    CopyData(theme_data)
	WriteTheme(themename, theme_data)
end)

for _, path in ipairs(filesystem.list_files(filesystem.resources_dir().."\\theme_loader\\themes")) do
    local themename = path:gsub(filesystem.resources_dir().."\\theme_loader\\themes\\", "")
    menu.list_action(themelist, themename, {}, "", {"Load", "Overwrite", "Delete"}, function(index, value, click_type)
        switch index do
            case 1:
                SetData(soup.json.decode(ReadTheme(themename:gsub(".json", ""))))
            break
            case 2:
                CopyData(theme_data)
                WriteTheme(themename:gsub(".json", ""), theme_data)
            break
            case 3:
                os.remove(path)
            break
        end
        menu.trigger_commands("themelist")
    end)
end