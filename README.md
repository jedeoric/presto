How to do a video for Orix (with Oric HD):

Source code of Displaying a video


* Download VLC
* you need pictconv (OSDK package)
* you need XA (OSDK package)
* oric-common (https://github.com/jedeoric/oric-common)

1) use vlc to convert video into 240*XXX video
2) use VLC to have each frames : https://www.isimonbrown.co.uk/vlc-export-frames/
3) and use this code (replace in source code the path of the video)
modify also make_data.bat in order to generate frame and to generate one file (in make_data.bat, it's "type" command)

