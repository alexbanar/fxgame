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
Copies jvm.dll file to /fxgame/bin/server/jvm.dll.
I have checked the place of jvm file by searching(without running last CMD by #CMD) into container.
Without this command there is an error that java file does not exist.

6.
From StackOverflow:
"I'd strongly encourage you to get the gradle build working locally before worrying about running it in docker; if you've got a JDK installed you may well not need gradle installed - is there a gradlew script in the working dir? ./gradlew dist will download and run gradle for you. Alternatively, if you insist on debugging the build in docker, you could try: docker run --rm -it -v "$PWD:/home/gradle/fxgame" gradle:jdk11 bash Then from the command prompt you can run cd fxgame && gradle dist and watch it fail because there's no dist task configured in the build.gradle." – Robert Elliot yesterday

7.
Running using Docker
"You can build container image from source code using the Dockerfile and run the containerized game. You have to share the X11 socket with the container. For that you need to install VcXsrv Windows X Server for windows or Xquartz if you're using macOS. Make sure to allow connections from network during setup. On macOS, you'll need to run xhost +127.0.0.1 every time you re-open Xquartz. The final step is to run the container: docker run -it --rm -e DISPLAY=host.docker.internal:0.0 image_name".
I have installed om my windows 10  VcXsrv Windows X Server for windows. The runnung of the container is shown on the screen of VcXsrv Windows X Server.

