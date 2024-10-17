# 💬 DialogService 🗨️
Easy, scriptable dialog with support for choices.

(NOTE: I forgot to convert sizes and position to the scale property while making Beta #1. Will be fixed in Beta #2)

# Symbol Book
- CROSS: Means that the API call can both be used on client and server scripts thanks to some RunService magic.

# Roadmap
## Method: DialogService:GetUserInfoByID()

Easily make back-to-back conversations with the player and NPC plus NPCs that can dynamically update with a player’s profile.
(Expected in Beta #2 (v0-beta.2))

## Method: DialogService:UpdateTextInDialog()

Create basic text animations and more without calling ShowDialog().
(Expected in Beta #2 (v0-beta.2))

## Method: DialogService:SetCameraPosition()

Easily create more immersive dialogue perspectives and dialogue-animatic hybrids.
(Expected in Beta #2 or #3 (v0-beta.2 or .3))

# API
## DialogService:ShowDialog (CROSS)

Shows a dialog with a name, image, and dialog.

Parameters:
- Player: Player instance, used for running on server script. For calls from client scripts, use Players.LocalPlayer for fill in this parameter.
- FireAllClients: Boolean, used for if you was to initiate dialog for all clients from the same server script.
- SpeakerName: String, used for the name of the speaker in the dialog.
- Dialog: String, used for what the speaker is saying.
- SpeakerImage: String, optional, used for the image of the speaker.
Example coming soon.

## DialogService:HideDialog (CROSS)

Hides the current dialog.

Parameters:
- Player: Player instance, used for running on server script. For calls from client scripts, use Players.LocalPlayer for fill in this parameter.
- FireAllClients: Boolean, used for if you was to initiate dialog for all clients from the same server script.
Example coming soon.

## DialogService:ShowChoices (CROSS)

Shows available choices for the current dialog.

Parameters:
- choiceFolder: Folder instance, place buttons or other GUI objects inside it will place the buttons in the choices sections.
- Player: Player instance, used for running on server script. For calls from client scripts, use Players.LocalPlayer for fill in this parameter.
- FireAllClients: Boolean, used for if you was to initiate dialog for all clients from the same server script.
Example coming soon.

## DialogService:ShowBoth (CROSS)

Calls DialogService:ShowDialog and DialogService:ShowChoices on nearly the same thread.

Parameters:
- Player: Player instance, used for running on server script. For calls from client scripts, use Players.LocalPlayer for fill in this parameter.
- FireAllClients: Boolean, used for if you was to initiate dialog for all clients from the same server script.
- SpeakerName: String, used for the name of the speaker in the dialog.
- Dialog: String, used for what the speaker is saying.
- SpeakerImage: String, optional, used for the image of the speaker.
- choiceFolder: Folder instance, place buttons or other GUI objects inside it will place the buttons in the choices sections.
Example coming soon.


# Making a custom Dialog UI
Here is a guide I made in a rush that shows what to not delete and what you are able to do without breaking the entire module

## DO NOT DELETE:
- Dialog
- SpeakerName
- RemoteEventHandler
- ChoiceContainer

## WHAT YOU ARE ABLE TO DO WITHOUT IT BREAKING
- Move and scale objects
- Anything else, like UI styling stuff, changing buttons to other UI interaction objects, and anything that doesn't delete the important items.
