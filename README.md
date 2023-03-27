[![AUR](https://img.shields.io/aur/version/gpth-bin?logo=arch-linux)](https://aur.archlinux.org/packages/gpth-bin)
[![total Github Releases downloads](https://img.shields.io/github/downloads/TheLastGimbus/GooglePhotosTakeoutHelper/total?label=total%20downloads)](https://github.com/TheLastGimbus/GooglePhotosTakeoutHelper/releases/)
[![latest version downloads](https://img.shields.io/github/downloads/TheLastGimbus/GooglePhotosTakeoutHelper/latest/total?label=latest%20version%20downloads)](https://github.com/TheLastGimbus/GooglePhotosTakeoutHelper/releases/latest)
[![resolved Github issues](https://img.shields.io/github/issues-closed/TheLastGimbus/GooglePhotosTakeoutHelper?label=resolved%20issues)](https://github.com/TheLastGimbus/GooglePhotosTakeoutHelper/issues)
[![commit activity](https://img.shields.io/github/commit-activity/y/TheLastGimbus/GooglePhotosTakeoutHelper)](https://github.com/TheLastGimbus/GooglePhotosTakeoutHelper/graphs/contributors)

# Google Photos Takeout Helper 📸🆘
## What is this for 🧐
If you ever want to move from Google Photos to other platform/solution, your fastest choice to export all photos is [Google Takeout 🥡](https://takeout.google.com/)

But when you download it, you will find yourself with zips with hundreds of little folders with weird `.json` files inside 🍝. 
What if you want to just have one folder with all photos, in chronological order? Good luck copying all of that 🙃

This script does just that - it organizes and cleans up your Takeout for you 🧹😌

It will take those zips, extract everything from them, set their and `file last modified` correctly, and put it in one big folder (or folders divided by a month) 🗄

## How to use:
Since `v3.2.0`, `gpth` is interactive 🎉 - you don't need to type any complicated arguments - just get your zips, run it, and follow prompted instructions 💃

If you want to run it on Synology, have problems with interactive, or just love cmd, look at ["Running manually with cmd"](#running-manually-with-cmd). Otherwise, just:

0. Get all your photos in [Google Takeout](https://takeout.google.com/) 📥
    - "deselect all" and then select only Google Photos
   
   (Note: don't unzip them, gpth will do it for you 😉)
1. Download the executable for your system from [releases tab](https://github.com/TheLastGimbus/GooglePhotosTakeoutHelper/releases) 🛒
    - [also available on AUR 😏](https://aur.archlinux.org/packages/gpth-bin)
2. - On Windoza: just double-click the downloaded `.exe` 🎉 - tell windoza defender that it's safe, and follow prompted instructions 🧾
   - On Mac/Linux: open terminal, `cd` to the folder with downloaded executable and run it:
     ```bash
     # if you have Mac with M1/M2 chip, you need to enable x86 emulation
     # otherwise, just skip it
     softwareupdate --install-rosetta
     
     cd Downloads # probably
     # add execute permission for file
     chmod +x gpth-macos # or gpth-linux
     # run it 🏃
     ./gpth-macos # or ./gpth-linux
     # follow prompted instructions 🥰
     ```

### Running manually with cmd

You may still need this mode if:
- You want to run on Synology where there are no ui programs required for interactive
  - You can read/discuss in #157 for any help
- Interactive unzipping crashes for you (known issue in windoza 😢 #178)
- Want to use this in other script/automation

In that case:
1. Manually unzip all your takeout zips and merge them into one folder
2. Open cmd and:
   - For windoza:
     ```bash
     # psst: in windoza cmd, you can just drag and drop files/folders to type them in
     # 1. change working directory to where gpth.exe is:
     cd Downloads  # Most probably
     # run it, selecting input and output folders with options like this:
     # (you can try to drag and drop them)
     gpth.exe --input "Downloads\you\input\folder" --output "C:\some\other\location" --albums "shortcuts"
     # select which album solution you like - see --help for all of them
     # remember to use "" !
     ```
   - For Linux/macOS:
     ```bash
     # ssh/whatever to where you're running it
     cd Downloads  # folder with gpth
     chmod +x gpth  # add execute permission
     ./gpth --input "/some/input/folder" --output "other/output/folder" --albums "shortcuts"
     # select which album solution you like - see --help for all of them
     ```

You can check all cmd flags by running `gpth --help` - for exapmle, the `--divide-to-dates` flag

## If I helped you, you can consider donating me ☕
I spent **a lot of** time fixing bugs and making this work stable 💖 - would be super thankful for any donations 🥰

[![Donate](https://img.shields.io/badge/Donate-PayPal-blue.svg?logo=paypal&style=for-the-badge)](https://www.paypal.me/TheLastGimbus)
[![Donate using ko-fi](https://ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/A0A6HO71P)
[![Donate using Liberapay](https://liberapay.com/assets/widgets/donate.svg)](https://liberapay.com/TheLastGimbus/donate)

## After exporting 🤔
### Be aware if you move your photos on your Android phone... ☝
(99% of the times), if you move some files in Android, their creation and modification time is reset to current.

"Simple Gallery" app usually keeps original file creation time when moving and coping (but I don't guarantee it). It's also pretty cool - check it out: https://github.com/SimpleMobileTools/Simple-Gallery

### What to do when you got rid of Google Photos? What are the alternatives? 🗺
 - I really recommend you using [Syncthing](https://syncthing.net/) for syncing your photos and files across devices. It does so through your local Wi-Fi, so you're not dependent on any service or internet connection. It will also keep original file creation date and metadata, so it resolves Android issue that I mentioned before.

 - If you want something more centralized but also self-hosted, [Nextcloud](https://nextcloud.com) is a nice choice, but its approach to photos is still not perfect. (And you need to set up your own server)

 - Guys at [Photoprism](https://photoprism.org/) are working on full Google Photos alternative, with search and AI tagging etc, but it's stil work in progress

### Other Takeout projects
I used this tool to export my notes to markdown - you can then edit them with any markdown editor you like :)

https://github.com/vHanda/google-keep-exporter

### Where is the Python script 🐍 ??
Yeah, the whole thing got re-written in Dart, and now it's way more stable and faster. If you still want Python for some reason, check out v2.x - in releases/tags

### TODO (Pull Requests welcome):
- [ ] GPS data: from JSON to Exif - ~~Thank you @DalenW 💖~~ still thank you, but it is now missing in the Dart version
- [ ] Writing data from `.json`s back to `EXIF` data
- [x] Some way to handle albums - THANK YOU @bitsondatadev 😘 🎉 💃
