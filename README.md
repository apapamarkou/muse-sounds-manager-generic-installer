# Muse Sounds Manager Installer

This project provides a universal Bash script to download, extract, and install the Muse Sounds Manager from its official `.tar.gz` package. The script automates the process of copying the necessary files to their appropriate system directories and setting up the application for use on any Linux distribution.

![muse-sounds-manager](https://github.com/user-attachments/assets/2452b9db-bc30-40c2-9070-423898e778ac)

## Why create this installer?

While MuseScore now provides a universal `.tar.gz` installer for the Muse Sounds Manager, the package does not handle system integration (e.g., creating `.desktop` entries or moving binaries and icons to standard directories). This script bridges that gap, ensuring a smooth installation experience and proper integration if your Linux system does not support **deb** or **rpm** packages (eg Arch, Solus, Slackware).

## Features

- **Universal Installation**: Works with the official `.tar.gz` package provided by MuseScore, supporting all Linux distributions.
- **Dynamic Version Handling**: Automatically detects the version of the extracted package.
- **System Integration**: Sets up application binaries, icons, and `.desktop` entries for easy access.
- **Automated Cleanup**: Removes temporary files after installation, keeping your system tidy.
- **Uninstaller Included**: Provides a script to completely remove the installed files.

## Prerequisites

Before running the script, ensure you have the following:

- A Linux-based operating system.
- `wget` installed for downloading the `.tar.gz` package.
- `tar` command available for extracting the `.tar.gz` package.
- Root permissions to install system-wide files.

## Install

Run the following command to download and install the Muse Sounds Manager:

```bash
wget -qO- https://raw.githubusercontent.com/apapamarkou/muse-sounds-manager-generic-installer/main/install_muse_sounds_manager.sh | sudo bash
```

This command will download and execute the script, setting up the Muse Sounds Manager on your system.

## Uninstall

If you need to remove the Muse Sounds Manager, run the uninstaller script:

```bash
wget -qO- https://raw.githubusercontent.com/apapamarkou/muse-sounds-manager-generic-installer/main/uninstall_muse_sounds_manager.sh | sudo bash
```

This command will remove all installed files and clean up your system.

## OpenSuSE Users: Fix for "Doesn't Work"

Both this installer and the official `.rpm` download require updated `ca-certificates` to function properly. To ensure it works, install the packages:

```bash
sudo zypper install ca-certificates*
```

## Usage

Once installed, you can find the Muse Sounds Manager in your application menus or launch it directly by typing `muse-sounds-manager` in a terminal.

## Contributing

Contributions to this project are welcome. Feel free to submit a pull request or open an issue on GitHub if you encounter any problems or have suggestions for improvements.

## Acknowledgments

- [MuseScore](https://musescore.org/) for providing the software and resources.

## Disclaimer

This script is provided "as is" without any warranties. Use it at your own risk.
