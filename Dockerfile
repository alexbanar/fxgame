Full version:
_______________________________________________________________________________
FROM gradle:jdk11 as builder
COPY --chown=gradle:gradle . /home/gradle/fxgame
WORKDIR /home/gradle/fxgame
RUN gradle dist --no-daemon
RUN unzip /home/gradle/fxgame/build/distributions/game2048-*.zip -d /tmp/fxgame

FROM ubuntu:18.04
COPY --from=builder /tmp/fxgame/image/ /fxgame
RUN apt-get update && apt-get install --no-install-recommends -y xorg libgl1-mesa-glx && rm -rf /var/lib/apt/lists/* 
WORKDIR /fxgame
CMD ./bin/fxgame
___________________________________________________________________________

Build:
docker build -t fxgame .
_____________________________________________________________________________
Result:
FAILURE: Build failed with an exception.
What went wrong:
Task 'dist' not found in root project 'fxgame'.
failed to solve with frontend dockerfile.v0:
failed to build LLB: executor failed running [/bin/sh -c gradle dist --no-daemon]:
runc did not terminate sucessfully
_________________________________________________________________________________
game2048-*.zip  from  line 7
link for copy:
https://github.com/brunoborges/fx2048/releases
________________________________________________________________________________
