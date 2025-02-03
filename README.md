# CloudDrive2 macos install using Homebrew
## Prerequisites

CloudDrive2 requires macFUSE for full functionality. Before installing CloudDrive2, please ensure macFUSE is installed. You can install macFUSE using Homebrew Cask:

```sh
brew install --cask macfuse
```

Alternatively, download and install it directly from the [macFUSE Official Website](https://macfuse.github.io/).

## Installation

To install CloudDrive2 via Homebrew, run the following commands in your terminal:

```sh
brew tap cloud-fs/clouddrive2
brew install clouddrive2
```

## Service Management
### Running the Service
Start the clouddrive2 service with

```sh
brew services start clouddrive2
```

Once started, access the web interface at [http://localhost:19798](http://localhost:19798)

### Stopping the Service
Stop the clouddrive2 service using 
```sh
brew service stop clouddrive2
```

### Uninstalling clouddrive2
To completely remove clouddrive2 from your system:
```sh
brew services stop clouddrive2
brew uninstall clouddrive2
```
Note: User data is retained after uninstallation. To completely remove user data, manually delete the directory at $HOME/Waytech/CloudDrive2