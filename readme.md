# Firstrun for Windows 10

This script aims to minimize the amount of time and work to reprovision your Windows 10 machine. It basically runs [Win10 Initial Setup Script](#usage-of-other-software) and uses Chocolatey to reinstall your software.

## Important information

- It may happen that you are not able to Update windows anymore, a quick fix is to make a `reclaim.preset` file and add this line `EnableTelemetry`.
- Please refer to the FAQ from the [Win10 Initial Setup Script](#usage-of-other-software) Repository for any questions.

## Configuration and usage

### Configuration

`install.preset`: List your Chocolatey package names line- and comma separated. (a sample `choco.preset` is included)

If you want to customize what the [Win10 Initial Setup Script](#usage-of-other-software) does, create a file called `reclaim.preset` and modify the settings. Please refer to the official [Win10 Initial Setup Script](#usage-of-other-software) Repository for detailed information.

### Usage

- Run `install.bat`.

## Usage of other software

The Script uses:

- [Win10 Initial Setup Script](https://github.com/Disassembler0/Win10-Initial-Setup-Script) script from [Disassembler0](https://github.com/Disassembler0)

- [Chocolatey](https://github.com/chocolatey/choco)

## TODO & Ideas

### TODO

- Fix the installation routine to apply only ones after that it should only update the programs

### Ideas

- One configuration file for anything (YAML, INI)
- CLI parameter for different profiles

## License

[MIT](https://mit-license.org/)