# Daybuilt GodotProject3D
[![Godot](https://img.shields.io/badge/Godot-v4.6.3%20-478CBF?logo=godot-engine&logoColor=white)](https://godotengine.org/download/)
[![MIT LICENSE](https://img.shields.io/badge/License-MIT%20-aa0000?logo=MIT&logoColor=white)](LICENSE)

Template Project for 3D Godot Projects designed to be forked for other projects.

## Features

### Components
|  Class Name   |  Description  | Extends From |
| ------------- | -------------- | -------------- |
| Component | Base class for all Components that exist outside of 2D or 3D space | Node |
| Component3D  | Base class for all Components that exist within 3D space | Node3D |
| AnalogCaptureComponent | Used for getting mouse and joystick movement for the Player's CameraController | Component |
| AudioComponent | Creates AudioStreamPlayer or AudioStreamPlayer3D for simple use cases | Component |
| DungeonComponent3D | Experimental component for creating procedually generated indoor environments | Component3D |
| HealthComponent | Deprecated component for handling the health of an entity | Component |
| SaveComponent | Experimental component for reading and writing save data for simple use cases | Component |
| StateMachine | Manages States and the transitions between them | Component |
| State | Base class for any StateMachine setup | Component |
| ResourceComponent | Experimental component for creating and managing any type of singular resource | Component |

### Included Addons
- [AmbientCG Browser](https://github.com/AzPepoze/godot-ambientcg) by AzPepoze & CSLRDoesntGameDev
- [DiscordRPC-GD](https://codeberg.org/vaporvee/discord-rpc-godot) by Vaporvee
- [TODO Manager](https://github.com/OrigamiDev-Pete/TODO_Manager) by OrigamiPete


## Contributions
If you find any issues or bugs feel free to create an issue or a Pull Request.
