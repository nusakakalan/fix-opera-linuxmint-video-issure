# Fix opera browser(Flathub) in linux mint video issue(Fix proprietary h.264 and aac support)
##This script is to solve the problem that the Opera browser flathub version in Linux Mint won't play videos.
* This script only support Flathub opera version
* This script must be executed after Opera each update or reinstall.

## Requirements
1. install Chromium web browser
    `sudo apt chromium`
## Usage
1. Run script.
    `sudo ./fix_opera_libffmpeg.sh`
## Testing
 Goto https://html5test.com/ in Opera and make sure it says h.264 and aac are supported.
