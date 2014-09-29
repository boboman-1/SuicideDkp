-----------------------------------------------------------------------------------------------
-- Client Lua Script for SuicideDkp
-- Copyright (c) NCsoft. All rights reserved
-----------------------------------------------------------------------------------------------
 
require "Window"
 
-----------------------------------------------------------------------------------------------
-- SuicideDkp Module Definition
-----------------------------------------------------------------------------------------------
local SuicideDkp = {} 
 
-----------------------------------------------------------------------------------------------
-- Constants
-----------------------------------------------------------------------------------------------
-- e.g. local kiExampleVariableMax = 999
 
-----------------------------------------------------------------------------------------------
-- Initialization
-----------------------------------------------------------------------------------------------
function SuicideDkp:new(o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self 

    -- initialize variables here

    return o
end

function SuicideDkp:Init()
	local bHasConfigureFunction = false
	local strConfigureButtonText = ""
	local tDependencies = {
		-- "UnitOrPackageName",
	}
    Apollo.RegisterAddon(self, bHasConfigureFunction, strConfigureButtonText, tDependencies)
end
 

-----------------------------------------------------------------------------------------------
-- SuicideDkp OnLoad
-----------------------------------------------------------------------------------------------
function SuicideDkp:OnLoad()
    -- load our form file
	self.xmlDoc = XmlDoc.CreateFromFile("SuicideDkp.xml")
	self.xmlDoc:RegisterCallback("OnDocLoaded", self)
end

-----------------------------------------------------------------------------------------------
-- SuicideDkp OnDocLoaded
-----------------------------------------------------------------------------------------------
function SuicideDkp:OnDocLoaded()

	if self.xmlDoc ~= nil and self.xmlDoc:IsLoaded() then
	    self.wndMain = Apollo.LoadForm(self.xmlDoc, "SuicideDkpForm", nil, self)
		if self.wndMain == nil then
			Apollo.AddAddonErrorText(self, "Could not load the main window for some reason.")
			return
		end
		
	    self.wndMain:Show(false, true)

		Apollo.RegisterSlashCommand("dkp", "OnSuicideDkpOn", self)
		Apollo.RegisterSlashCommand("DKP", "OnSuicideDkpOn", self)
		Apollo.RegisterSlashCommand("DkP", "OnSuicideDkpOn", self)
		Apollo.RegisterSlashCommand("Dkp", "OnSuicideDkpOn", self)
		Apollo.RegisterSlashCommand("DKp", "OnSuicideDkpOn", self)
		Apollo.RegisterSlashCommand("DKP", "OnSuicideDkpOn", self)
		Apollo.RegisterSlashCommand("dKp", "OnSuicideDkpOn", self)
		Apollo.RegisterSlashCommand("DKp", "OnSuicideDkpOn", self)
		Apollo.RegisterSlashCommand("DKP", "OnSuicideDkpOn", self)
		Apollo.RegisterSlashCommand("dKP", "OnSuicideDkpOn", self)

	end
end

-----------------------------------------------------------------------------------------------
-- SuicideDkp Functions
-----------------------------------------------------------------------------------------------
-- Define general functions here

-- on SlashCommand "/dkp"
function SuicideDkp:OnSuicideDkpOn()
	self.wndMain:Invoke() -- show the window
end


-----------------------------------------------------------------------------------------------
-- SuicideDkpForm Functions
-----------------------------------------------------------------------------------------------
-- when the OK button is clicked
function SuicideDkp:OnOK()
	self.wndMain:Close() -- hide the window
end

-- when the Cancel button is clicked
function SuicideDkp:OnCancel()
	self.wndMain:Close() -- hide the window
end


function SuicideDkp:addPlayer( wndHandler, wndControl, eMouseButton )
	self.wndMain:FindChild("TreeControl")
end

-----------------------------------------------------------------------------------------------
-- SuicideDkp Instance
-----------------------------------------------------------------------------------------------
local SuicideDkpInst = SuicideDkp:new()
SuicideDkpInst:Init()
