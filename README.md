# MacPT
[![forthebadge](https://forthebadge.com/images/badges/made-with-c-plus-plus.svg)](https://forthebadge.com)
[![forthebadge](https://forthebadge.com/images/badges/makes-people-smile.svg)](https://forthebadge.com)
[![forthebadge](http://forthebadge.com/images/badges/built-with-love.svg)](http://forthebadge.com)

[![GitHub issues](https://img.shields.io/github/issues/Official-polar-team/MacPT?style=for-the-badge)](https://github.com/Official-polar-team/MacPT/issues)
[![GitHub stars](https://img.shields.io/github/stars/Official-polar-team/MacPT?style=for-the-badge)](https://github.com/Official-polar-team/MacPT/stargazers)
[![GitHub license](https://img.shields.io/github/license/Official-polar-team/MacPT?style=for-the-badge)](https://github.com/Official-polar-team/MacPT/blob/master/COPYING)

The first modern port of Debian's ```apt``` command line package managment interface for macOS!. Here is an example of it running on macOS 10.15 (Catalina) on iTerm 2.

![Running on terminal](https://i.imgur.com/rwK4nFH.png)

*If you are intersted into this iTerm 2 configurtion you can read this [gist](https://lol.com)*

# Table of contents

- [Usage](#usage)
  - [Flags](#flags)
    - `List`
    - `Search`
    - `Show`
    - `Install` 
    - `Reinstall`
    - `Remove` 
    - `Autoremove`
    - `Update` 
    - `Upgrade`
    - `Full-upgrade`
    - `Edit-Sources`

- [Installation](#installation)
- [Uninstallation](#uninstallation)
- [Contributors](#contributors)
- [Built with MacPT](#buildwithmacpt)

# Usage

[(Back to top)](#table-of-contents)

APT is easy to use and a single thing is required to get it to work and run (More info in [flags)](#flags)

To execute MacPT write the command ```apt``` to display a helpfull list of all APT options

*As a bonus you can always run ```man apt``` to see more!*

### Flags 

- With `List` : list packages based on package names

![image]()

- With `Search` :  Searchs packages in your repositories

![image]()

- With `Show` : Gets specific package details

![image]()

- With `Install` : Installs a specific (or specifics) package with it's dependencies 

![image]()

- With `Reinstall` : Reinstalls a specific (or specifics) package with it's dependencies 

![image]()

-With `Remove` : Removes a package but it doesn't remove it's dependencies

![image]()

- With `Autoremove` : Removes unused packages (Orphans)

![image]()

-With `Update` : Updates the packagae database available from your repositories

![image]()

- With `Upgdrade` : Upgrades all packages that have available updates

![image]()

-With `Edit-sources` : Opens a valid source editor

![image]()

- With `Satisfy` : Satisfy dependencies

![image]()

# Installation 

[(Back to top)](#table-of-contents)

Installing MacPT is super easy and you always have two options!:

### Precompiled binaries (Recommended)

This option is faster, and saves a lot of time, while also allowing you to get a valid MacPT installation, to do that just copy and paste this terminal command:

``sudo /bin/zsh -c "$(/usr/bin/curl -fsSL https://raw.githubusercontent.com/Official-polar-team/Mac-APT Installer/master/macpt_install.sh)"``

After running this you should have a valid MacPT installation

### Building from source

Building from source is harder and requires you to build from source things like DPKG and Docbook, since we are not going into that part in this tutorial, you are on your own.

Once you have satisfied all your dependencies, use ```cd``` to go to the directory where you cloned the repository, now execute the command ```./build-mac.sh``` this will generate deb files that you can install with DPKG.

# Uninstallation 

You can't unistall this yet lol

# Contributors & Credits

### 1.8.0
- [@DiegoMagdaleno](https://github.com/DiegoMagdaIeno) - MacPT 1.8.0 basic patching. 
- [@Diatrus](https://github.com/Diatrus) - MacPT 1.8.0 postinstallation and boostrap. 

### 1.8.2
- [@Diatrus](https://github.com/Diatrus) - MacPT 1.8.2 patching and postinstallation.

### 1.9.3
- [@DiegoMagdaleno](https://github.com/DiegoMagdaIeno) - MacPT 1.9.3 patching and postinstallation.

### Additional credits

- [@CoolStar]() - Assitance and advice
- [@Saurik]() - Example patches
- [@Debian]() - APT development

# Built with MacPT

Soon!






