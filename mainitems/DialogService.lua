local Events = script.Events
local Properties = script.Properties
local Signal = require(script.Signal)
local ShowDialogEvent = Events.ShowDialog
local HideDialogEvent = Events.HideDialog
local ShowChoicesEvent = Events.ShowChoices
local UpdateDialogEvent = Events.UpdateDialog
local RemoveChoicesEvent = Events.RemoveChoices
local GetInfoEvent = Events.GetUserInfoByID
local SendInfoEvent = Events.SendUserInfoByID
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local UserService = game:GetService("UserService")
local LocalizationService = game:GetService("LocalizationService")
local ChoiceAmount = 0

local DialogService = {}

DialogService.FALLBACK = "rbxassetid://137739665907764"

function DialogService:ShowDialog(
	Player: Player, 
	FireAllClients: boolean, 
	SpeakerName: string, 
	Dialog: string, 
	SpeakerImage: string)
	if SpeakerName and Dialog then
		if RunService:IsClient() then
			local PlayerGui = Players.LocalPlayer:WaitForChild("PlayerGui")
			if PlayerGui then
				local DialogGui = PlayerGui:FindFirstChild("DialogGui")
				if DialogGui then
					local DialogFrame = DialogGui:FindFirstChild("DialogFrame")
					if DialogFrame then
						local SpeakerLabel = DialogFrame:FindFirstChild("SpeakerName")
						local DialogLabel = DialogFrame:FindFirstChild("Dialog")
						local SpeakerImageLabel = DialogFrame:FindFirstChild("SpeakerImage")
						if SpeakerLabel and DialogLabel and SpeakerImageLabel then
							SpeakerLabel.Text = SpeakerName
							DialogLabel.Text = Dialog
							SpeakerImageLabel.Image = SpeakerImage
						end
					end
				end
			end
		elseif RunService:IsServer() then
			if FireAllClients == true then
				ShowDialogEvent:FireAllClients(SpeakerName, Dialog, SpeakerImage)
			else
				ShowDialogEvent:FireClient(Player, SpeakerName, Dialog, SpeakerImage)
			end
		end
		
	end
end

function DialogService:HideDialog(Player: Player, FireAllClients: boolean)
	if RunService:IsClient() then
		local PlayerGui = Players.LocalPlayer:WaitForChild("PlayerGui")
		if PlayerGui then
			local DialogGui = PlayerGui:FindFirstChild("DialogGui")
			if DialogGui then
				local DialogFrame = DialogGui:FindFirstChild("DialogFrame")
				if DialogFrame then
					DialogFrame.Visible = false
				end
			end
		end
	elseif RunService:IsServer() then
		if FireAllClients == true then
			HideDialogEvent:FireAllClients()
		else
			HideDialogEvent:FireClient(Player)
		end
	end
end

function DialogService:ShowChoices(
	choiceFolder: Instance,
	Player: Player,
	FireAllClients: boolean)
	if RunService:IsClient() then
		local PlayerGui = Players.LocalPlayer:WaitForChild("PlayerGui")
		if PlayerGui then
			for _, choice in PlayerGui.DialogGui.DialogFrame.ChoiceContainer.Choices:GetChildren() do
				if choice:IsA("TextButton") then
					choice:Destroy()
				end
			end
			ChoiceAmount = 0
			if PlayerGui.DialogGui.DialogFrame.Visible == true then
				for _, choice in choiceFolder:GetChildren() do
					local cloneChoice = choice:Clone()
					cloneChoice.Parent = PlayerGui.DialogGui.DialogFrame.ChoiceContainer.Choices
				end
			end
		end
	elseif RunService:IsServer() then
		if choiceFolder then
			if FireAllClients == true then
				ShowChoicesEvent:FireAllClients(choiceFolder)
			else
				ShowChoicesEvent:FireClient(Player, choiceFolder)
			end
		end
	end
end

function DialogService:RemoveChoices(Player: Player, FireAllClients: boolean)
	if RunService:IsClient() then
		local PlayerGui = Players.LocalPlayer:WaitForChild("PlayerGui")
		if PlayerGui then
			for _, choice in PlayerGui.DialogGui.DialogFrame.ChoiceContainer.Choices:GetChildren() do
				if choice:IsA("TextButton") then
					choice:Destroy()
				end
			end
		end
	elseif RunService:IsServer() then
		if FireAllClients == true then
			RemoveChoicesEvent:FireAllClients()
		else
			RemoveChoicesEvent:FireClient(Player)
		end
	end
end

function DialogService:ShowBoth(
	Player: Player, 
	FireAllClients: boolean, 
	SpeakerName: string, 
	Dialog: string, 
	SpeakerImage: string,
	choiceFolder: Instance)
	DialogService:ShowDialog(Player, FireAllClients, SpeakerName, Dialog, SpeakerImage)
	DialogService:ShowChoices(choiceFolder, Player, FireAllClients)
end

function DialogService:UpdateTextInDialog(Player: Player, FireAllClients: boolean, Dialog: string)
	if RunService:IsClient() then
		local PlayerGui = Players.LocalPlayer:WaitForChild("PlayerGui")
		if PlayerGui then
			local DialogGui = PlayerGui:FindFirstChild("DialogGui")
			if DialogGui then
				local DialogFrame = DialogGui:FindFirstChild("DialogFrame")
				if DialogFrame then
					local DialogLabel = DialogFrame:FindFirstChild("Dialog")
					if DialogLabel then
						DialogLabel.Text = Dialog
					end
				end
			end
		end
	elseif RunService:IsServer() then
		if FireAllClients == true then
			UpdateDialogEvent:FireAllClients(Dialog)
		else
			UpdateDialogEvent:FireClient(Player, Dialog)
		end
	end
end


return DialogService
