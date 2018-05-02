# Firstrun for Windows 10

This script aims to minimize the amount of time and work to reprovision your Windows 10 machine. It basically runs [Win10 Initial Setup Script](#Usage-of-other-software) and uses Chocolatey to reinstall your software.

## Important informatons
- It may happen that you are not able to Update windows anymore, therefore I disabled the Temetetry option in the Preset.

## Configuration and usage

### Configuration
`install.txt`: List your Chocolatey package names line- and comma seperated. Needs git as the first package.

`reclaimPreset.txt`: Default Reclaim Windows 10 preset - change to your (or your company's preferences). For more details, check the file and the Reclaim Windows 10 repo. 

### Usage
- Run `install.bat`.

## Usage of other software
The Script uses:
- [Win10 Initial Setup Script](https://github.com/Disassembler0/Win10-Initial-Setup-Script) script from [Disassembler0](https://github.com/Disassembler0)
- [Chocolatey](https://github.com/chocolatey/choco)

## License
[MIT](https://mit-license.org/)