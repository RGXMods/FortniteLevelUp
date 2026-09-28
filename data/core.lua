--=====================================================================================
-- FNLU | FortniteLevelUp - core.lua
-- Version: 2.0.0
-- Author: DonnieDice
-- RGX Mods Collection - RealmGX Community Project
--=====================================================================================

local RGX = assert(_G.RGXFramework, "FNLU: RGX-Framework not loaded")

FNLU = FNLU or {}

local ADDON_VERSION = "2.0.4"
local ADDON_NAME = "FortniteLevelUp"
local PREFIX = "|Tinterface/addons/FortniteLevelUp/media/icon:16:16|t - |cffffffff[|r|cff94499bFNLU|r|cffffffff]|r "
local TITLE = "|Tinterface/addons/FortniteLevelUp/media/icon:18:18|t [|cff94499bF|r|cffffffffortnite|r |cff94499bL|r|cffffffffevel|r |cff94499bU|r|cff94499bp|r|cff94499b!|r]"

FNLU.version = ADDON_VERSION
FNLU.addonName = ADDON_NAME

local Sound = RGX:GetSound()

local handle = Sound:Register(ADDON_NAME, {
sounds = {
high = "Interface\\Addons\\FortniteLevelUp\\sounds\\fortnite_high.ogg",
medium = "Interface\\Addons\\FortniteLevelUp\\sounds\\fortnite_med.ogg",
low = "Interface\\Addons\\FortniteLevelUp\\sounds\\fortnite_low.ogg",
},
defaultSoundId = 569593,
savedVar = "FNLUSettings",
defaults = {
enabled = true,
soundVariant = "medium",
muteDefault = true,
showWelcome = true,
volume = "Master",
firstRun = true,
},
triggerEvent = "PLAYER_LEVEL_UP",
addonVersion = ADDON_VERSION,
})

FNLU.handle = handle

local L = FNLU.L or {}
local initialized = false

local function ShowHelp()
print(PREFIX .. " " .. (L["HELP_HEADER"] or ""))
print(PREFIX .. " " .. (L["HELP_TEST"] or ""))
print(PREFIX .. " " .. (L["HELP_ENABLE"] or ""))
print(PREFIX .. " " .. (L["HELP_DISABLE"] or ""))
print(PREFIX .. " " .. (L["HELP_HIGH"] or ""))
print(PREFIX .. " " .. (L["HELP_MEDIUM"] or ""))
print(PREFIX .. " " .. (L["HELP_LOW"] or ""))
end

local function HandleSlashCommand(args)
local command = string.lower(args or "")
if command == "" or command == "help" then
ShowHelp()
elseif command == "test" then
print(PREFIX .. " " .. (L["PLAYING_TEST"] or ""))
handle:Test()
elseif command == "enable" then
handle:Enable()
print(PREFIX .. " " .. (L["ADDON_ENABLED"] or ""))
elseif command == "disable" then
handle:Disable()
print(PREFIX .. " " .. (L["ADDON_DISABLED"] or ""))
elseif command == "high" then
handle:SetVariant("high")
print(PREFIX .. " " .. string.format(L["SOUND_VARIANT_SET"] or "%s", "high"))
elseif command == "med" or command == "medium" then
handle:SetVariant("medium")
print(PREFIX .. " " .. string.format(L["SOUND_VARIANT_SET"] or "%s", "medium"))
elseif command == "low" then
handle:SetVariant("low")
print(PREFIX .. " " .. string.format(L["SOUND_VARIANT_SET"] or "%s", "low"))
else
print(PREFIX .. " " .. (L["ERROR_PREFIX"] or "") .. " " .. (L["ERROR_UNKNOWN_COMMAND"] or ""))
end
end

RGX:RegisterEvent("ADDON_LOADED", function(event, addonName)
if addonName ~= ADDON_NAME then return end
handle:SetLocale(FNLU.L)
L = FNLU.L or {}
handle:Init()
initialized = true
end, "FNLU_ADDON_LOADED")

RGX:RegisterEvent("PLAYER_LEVEL_UP", function()
if initialized then
handle:Play()
end
end, "FNLU_PLAYER_LEVEL_UP")

RGX:RegisterEvent("PLAYER_LOGIN", function()
if not initialized then
handle:SetLocale(FNLU.L)
L = FNLU.L or {}
handle:Init()
initialized = true
end
handle:ShowWelcome(PREFIX, TITLE)
end, "FNLU_PLAYER_LOGIN")

RGX:RegisterEvent("PLAYER_LOGOUT", function()
handle:Logout()
end, "FNLU_PLAYER_LOGOUT")

RGX:RegisterSlashCommand("fnlu", function(msg)
local ok, err = pcall(HandleSlashCommand, msg)
if not ok then
print(PREFIX .. " " .. (L["ERROR_PREFIX"] or "") .. " " .. tostring(err))
end
end, "FNLU_SLASH")
