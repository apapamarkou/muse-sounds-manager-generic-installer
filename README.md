# Muse Sounds Manager Installer

This project provides a simple Bash script to download, extract, and install the Muse Sounds Manager from its `.deb` package. The script automates the process of setting up the necessary directories and copying files to their appropriate locations on your system.

![muse-sounds-manager](https://github.com/user-attachments/assets/2452b9db-bc30-40c2-9070-423898e778ac)


## Why create an alternative installer?

While MuseScore provides excellent sound libraries, it doesn't offer a universal installer. This can be a challenge for users of independent distributions like Arch, Slackware, Solus, and others that don’t use the official supported package managers. This alternative installer simplifies the process, making it easy to set up the MuseScore Sound Manager on a wider range of systems.

## Features

- **Automated Download**: Downloads the latest Muse Sounds Manager `.deb` package directly from the official source.
- **Easy Installation**: Extracts and installs the package contents (`opt` and `usr` directories) to your system with a single command.
- **Cleanup**: Removes temporary files after installation, keeping your system tidy.

## Prerequisites

Before running the script, ensure you have the following:

- A Linux-based operating system.
- `wget` installed for downloading the `.deb` package.
- `ar` and `tar` commands available for extracting the `.deb` package.

## Install

Copy the following command, paste it in a terminal and hit [ENTER]. Thats it!

```bash
wget -qO- https://raw.githubusercontent.com/apapamarkou/muse-sounds-manager-generic-installer/main/install_muse_sounds_manager.sh | bash
```

This command will download and execute the script, installing the Muse Sounds Manager on your system.

## OpenSuSE only: fix "doesn't work"

Both this installer and the official rpm download require ca-certificates to function properly. To ensure it works, install the packages :

```
sudo zypper install ca-certificates*
```

## Usage

Once installed, you can find the Muse Sounds Manager in your application menus or launchers

## Contributing

Contributions to this project are welcome. Feel free to submit a pull request or open an issue on GitHub if you encounter any problems or have suggestions for improvements.

## Acknowledgments

- [Musescore](https://musescore.org/) for providing the software.

## Disclaimer

This script is provided "as is" without any warranties. Use it at your own risk.

