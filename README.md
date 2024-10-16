# 💬 DialogService 🗨️
Easy, scriptable dialog with support for choices.

(NOTE: I forgot to convert sizes and position to the scale property while making Beta #1. Will be fixed soon)

# Symbol Book
- CROSS: Means that the API call can both be used on client and server scripts thanks to some RunService magic.

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
- Anything else, like UI styling stuff, changing buttons to ImageButtons, and anything that doesn't delete the important items.
