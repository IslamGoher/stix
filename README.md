# STIX: Script To Install Xbps-src packages

stix is a shell script designed to simplify the process of cloning the xbps-src repository and installing packages from it. xbps-src is the build system used by the Void Linux distribution to build packages. This script automates the setup and installation steps, making it easier for users to manage and install software directly from the source.

## Installation
* **Cloning the repo**
  ```bash
  $ git clone https://github.com/IslamGoher/stix.git ~/.packages/stix
  ```

* **Grant access to the script**
  ```bash
  $ chmod +x ~/.packages/stix/stix.sh
  ```

* **Link the script to the bin folder**
  ```bash
  $ ln ~/.packages/stix/stix.sh /bin/stix
  ```

* **Initialize stix by cloning the xbps-repo**
  ```bash
  $ stix init
  ```

## Usage

```bash
$ stix help
```
```
Usage: stix [argument] [package name]
Arguments:
  [init]: for cloning the xbps-src repository
  [pull] or [p]: for syncing the repository
  [search] or [s]: for displaying the available packages
  [install] or [i]: for installing the packge
```

**Example**
  ```bash
  $ stix install google-chrome
  ```
