How to replace Spotify icon in top panel (and optionally for workspace):
- step 1: `sudo apt-get install gksu`
- step 2: `gksu xdg-open /opt/spotify/spotify-client/Data/resources.zip`
- step 3: go to `_linux` subdirectory and replace existing icon (`spotify-linux-512.png`) with new
- step 4: optionally you can replace `spotify_icon.ico` file with new icon, if you want to have white icon in workspace preview

**There's script to automate this task available at**: https://github.com/faviouz/fix-spotify-icon

