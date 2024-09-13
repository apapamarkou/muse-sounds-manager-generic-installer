# Muse Sounds Manager Installer

This project provides a simple Bash script to download, extract, and install the Muse Sounds Manager from its `.deb` package. The script automates the process of setting up the necessary directories and copying files to their appropriate locations on your system.

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

## Install Option 1 : "The Quick and easy"

Copy the following command, paste it in a terminal and hit [ENTER]. Thats it!

```bash
wget -qO- https://raw.githubusercontent.com/apapamarkou/muse-sounds-manager-generic-installer/main/install_muse_sounds_manager.sh | bash
```

These commands will download and execute the script, installing the Muse Sounds Manager on your system.

## Install Option 2: "The long way"

If you prefer to clone the repository and run the script manually, follow these steps:

1. **Clone this repository**:

    ```bash
    git clone https://github.com/yourusername/muse-sounds-manager-installer.git
    cd muse-sounds-manager-installer
    ```

2. **Make the script executable**:

    ```bash
    chmod +x install_muse_sounds_manager.sh
    ```

3. **Run the script**:

    ```bash
    ./install_muse_sounds_manager.sh
    ```

    This will download, extract, and install the Muse Sounds Manager to your system.

## OpenSuSE only: fix "doesn't work"

This installer and official `rpm` download wont work without installing `ca-certificates`. To make it work run the following command:

```
sudo zypper install ca-certificates*
```

## Usage

Once installed, you can find the Muse Sounds Manager in your application menus or launchers

## Contributing

Contributions to this project are welcome. Feel free to submit a pull request or open an issue on GitHub if you encounter any problems or have suggestions for improvements.

## License

This project is licensed under the GNU General Public License v3.0. See the [LICENSE](LICENSE) file for details.

## Acknowledgments

- [Musescore](https://musescore.org/) for providing the software.

## Disclaimer

This script is provided "as is" without any warranties. Use it at your own risk.

