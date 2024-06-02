# Pac-Man Game (Text-based) 🕹️

Welcome to a simple text-based version of Pac-Man! Please note that this version is a work in progress, with some features missing or incomplete.

## Features 🎮
- Move Pac-Man around a maze
- Collect coins while avoiding walls and ghosts
- Simple text-based graphics

## Usage ℹ️
1. **Install Visual Studio**
2. **Create an Empty C++ Project**
3. **Convert the Solution Platform to x86**
4. **Delete the Header, Resource, and Source Files in the Project**
5. **Go to Build Dependencies of the Project and Select .masm, then Check It**
6. **Create a .asm File**
7. **Add Code to It**

## Dependencies 🛠️
- This project uses the Irvine32 library. Download it [here](link-to-download) and unzip it in the `C:` drive. Copy the path of the `irvine` folder.
- Go to the Linker General Settings and add the path of the `irvine` folder (e.g., `C:\irvine`) in the additional dependencies.
- In the Linker's Input settings, add `irvine32.lib` to the additional dependencies.
- Go to the Properties of the .asm file in the project and select "Microsoft Macro Assembler" as the item type in the general settings.
- In the Microsoft Assembler settings, add the path of the `irvine` folder to the include paths.

## Sound and Debugging 🛠️
- **Sound:** Sound functionality is implemented yet but files be added in future updates that's why it can create warning sound but game works fine.
- **Debugging:** Some debugging is remaining, and contributions are appreciated.

## How to Run 🚀
- Build the project in Visual Studio.
- Run the executable.

## Contributions and Issues 🙌
- Contributions are appreciated! If you encounter any issues or have suggestions, please open an issue on GitHub.

## Video
[Watch Gameplay Video](https://drive.google.com/file/d/1cChtQMueCt0uTdb17Lnk71_08nDZ_sbs/preview)
