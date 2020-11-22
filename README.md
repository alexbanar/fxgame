# fxgame
1.Link to article with code https://aboullaite.me/javafx-docker/

2.Link to git to needed code for article code to run https://github.com/brunoborges/fx2048/

3.
This from article is connected to the command: COPY --from=builder /tmp/fxgame/image/ /fxgame
"I used multistage build to build the app, 
generate the zip file,extract it and
copy only the extracted files to the final container image.
Note that I chose to build the app from the source code,
as I could simply download and extract the zip directly from the project releases"

4.
About the second part of dockerfile:
RUN apt-get update && apt-get install --no-install-recommends -y xorg libgl1-mesa-glx && rm -rf /var/lib/apt/lists/* 
"The second stage uses ubuntu 18.04 as base image."

"I also installed xorg(https://dri.freedesktop.org/wiki/libGL/) as display server, 
and the libgl1-mesa-glx package containing the LibGL library(https://www.x.org/wiki/).
The rest is pretty straightforward"

5.
COPY --chown=gradle:gradle . /home/gradle/fxgame
Copies java.dll file to /fxgame/bin/server/jvm.dll
I have checked this by searching(without running last CMD by #CMD) into container 
Without this command there is an error that java file not exist.


