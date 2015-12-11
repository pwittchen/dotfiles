#### How to change default Skype icon in top panel to monochromatic white icon?

Original post: http://askubuntu.com/a/549964/435240

**Script for automating all of these tasks**: https://github.com/pwittchen/fix-skype-icon

##### Instructions

I made a .deb package with a hack that compels sni-qt:i386 to use images located in `/usr/share/pixmaps/skype/` directory for systemtray skype status icons, based on webguruz.ru page posted by @user312051.

**To install**

```
wget https://www.dropbox.com/s/x91gec5q0uz3hnx/sni-qt_0.2.6-0ubuntu1_i386-modified.deb?dl=0 -O sni-qt_0.2.6-0ubuntu1_i386-modified.deb

sudo dpkg -i sni-qt_0.2.6-0ubuntu1_i386-modified.deb
```

Then you need to install new icons, for that follow the steps bellow:

```
wget https://www.dropbox.com/s/wimn53noljv0vbi/skype_systemtray_custom_icons.zip?dl=0 -O skype_systemtray_custom_icons.zip

unzip skype_systemtray_custom_icons.zip

sudo mkdir /usr/share/pixmaps/skype

sudo cp skype/* /usr/share/pixmaps/skype

sudo chmod +r /usr/share/pixmaps/skype/*
```

The icon set I provide here is based on Faenza-Dark Theme, for change the icons, just replace the images in `/usr/share/pixmaps/skype directory`.

**To remove**

```
sudo dpkg -r sni-qt_0.2.6-0ubuntu1_i386-modified.deb
sudo rm -r /usr/share/pixmaps/skype
```
