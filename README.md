# NP GamepadViewer

This is my little GamepadeViewer I cobbled together in an afternoon, when gamepadviewer.com stopped working for me in OBS.
In the future I want to make it entirely configureable, so people can use their own layouts if they want.

![image](https://github.com/user-attachments/assets/817db36c-a6cd-4839-878a-47a0d3bb91fb)

## Usage

### Option A

To use this in OBS, I recommend you use the [Spout2 OBS plugin](https://github.com/Off-World-Live/obs-spout2-plugin) if you're on Windows.
If you have it installed, just add a new "Spout2 Capture" to your sources, select the gamepadviewer, and set "Composite Mode" to default:

![image](https://github.com/user-attachments/assets/c20a09e8-4682-4802-9f67-02e6141f7932)

### Option B
If you do not have the Spout plugin, you can still add it as a "Game Capture".
In this case, you need to check "Allow Transparency" in the source properties.
That way the window background will be recognized by OBS as transparent, when the GamepadViewer not the focused window.

![image](https://github.com/user-attachments/assets/479e342b-e880-42d7-9a18-e572ecd801ad)

## Assets used

- Xbox controller base from: https://creazilla.com/media/clipart/1631895/xbox-controller
- Other inputs from Kenney: https://kenney.nl/assets/input-prompts

## TODO

- [ ] make layout configurable
  - [ ] EDN parser?
  - [ ] Maybe load config as GDScript file
- [ ] allow switching between different layouts
- [ ] customizable background color (for OBS Color Key filter, if Spout is unavailable)
- [ ] Linux & MacOS builds
