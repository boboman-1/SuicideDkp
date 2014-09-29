require "Window"
 

local SuicideDkp = {} 

function SuicideDkp:new(o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self 

    return o
end

function SuicideDkp:Init()
	local bHasConfigureFunction = false
	local strConfigureButtonText = ""
	local tDependencies = {}
	
    Apollo.RegisterAddon(self, bHasConfigureFunction, strConfigureButtonText, tDependencies)
end

function SuicideDkp:OnLoad()
    -- load our form file
	self.xmlDoc = XmlDoc.CreateFromFile("SuicideDkp.xml")
	self.xmlDoc:RegisterCallback("OnDocLoaded", self)
end

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

-- on SlashCommand
function SuicideDkp:OnSuicideDkpOn()
	self.wndMain:Invoke()
end


function SuicideDkp:OnOK()
	self.wndMain:Close() 
end

function SuicideDkp:OnCancel()
	self.wndMain:Close() -- hide the window
end


function SuicideDkp:addPlayer( wndHandler, wndControl, eMouseButton )
	self.wndMain:FindChild("TreeControl")
end

local SuicideDkpInst = SuicideDkp:new()
SuicideDkpInst:Init()
