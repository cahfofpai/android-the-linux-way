# Android backups the Linux way

Backing up your phone to your computer over USB using [restic](https://restic.net) and adb.

## Requirements

### Phone

* [Termux](https://termux.dev)
* restic installed inside Termux
* adb root available (supported by e.g. LineageOS)

### Computer

* [Rest Server (restic backup server)](https://github.com/restic/rest-server)
* adb
* node, npm and npx

## Setup

Copy `.env.sh.example` to `.env.sh` and adapt the settings

Copy `exclude-file.example` to `exclude-file` and adapt the settings

Initialise restic repo: `restic init -r REPO`

Install js dependencies: `npm install`

## Use

Navigate into this directory and execute the script.
