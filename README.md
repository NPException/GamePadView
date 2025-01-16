# NP GamePadView

This is my little GamepadeViewer I cobbled together in an afternoon, when gamepadviewer.com stopped working for me in OBS.
In the future I want to make it entirely configureable, so people can use their own layouts if they want.

![image](https://github.com/user-attachments/assets/9399f574-d7df-42d6-9521-83a91e8dc8b9)

## Usage

To use this in OBS, I recommend you use the [Spout2 OBS plugin](https://github.com/Off-World-Live/obs-spout2-plugin) if you're on Windows.
If you have it installed, just add a new "Spout2 Capture" to your sources, select the gamepadviewer, and set "Composite Mode" to default:

![image](https://github.com/user-attachments/assets/30fea879-8937-499b-8ccf-58bb4b4487f9)

If you do not have the Spout plugin, you can still add it as a "Game Capture" or "Window Capture".
In this case, you need to add a "Color Key" effect filter to the source, and key out the background, like so:

![image](https://github.com/user-attachments/assets/16766969-a9dc-4eb2-892e-1631a5d4079c)

## Assets used

- Xbox controller base from: https://creazilla.com/media/clipart/1631895/xbox-controller
- Other inputs from Kenney: https://kenney.nl/assets/input-prompts

## TODO

- [ ] make layout configurable
- [ ] allow switching between different layouts
- [ ] customizable background color (for OBS Color Key filter, if Spout is unavailable)
- [ ] Linux & MacOS builds
