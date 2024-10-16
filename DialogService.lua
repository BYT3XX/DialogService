local Events = script.Events
local Properties = script.Properties
local Signal = require(script.Signal)
local ShowDialogEvent = Events.ShowDialog
local HideDialogEvent = Events.HideDialog
local ShowChoicesEvent = Events.ShowChoices
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local ChoiceAmount = 0

local DialogService = {}

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
			for _, choice in PlayerGui.DialogFrame.ChoiceContainer.Choices:GetChildren() do
				choice:Destroy()
			end
			ChoiceAmount = 0
			if PlayerGui.DialogFrame.Visible == true then
				for _, choice in choiceFolder:GetChildren() do
					ChoiceAmount = ChoiceAmount + 1
					local ChoiceToRemove = PlayerGui.DialogFrame.ChoiceContainer.Choices:FindFirstChild("Choice"..ChoiceAmount)
					if ChoiceToRemove then
						ChoiceToRemove:Destroy()
					end
					local cloneChoice = choice:Clone()
					cloneChoice.Parent = PlayerGui.DialogFrame.ChoiceContainer.Choices
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



return DialogService
