Robotframework script to automate various features of Prove Expertise Oy website.

If on windows and using wsl:
```
wsl docker build -t prove-website-robot .

wsl docker run -it --rm -v .:/test-prove-website prove-website-robot bash -c "robot --outputdir output tasks/tasks.robot"
```

On Linux:
```
docker build -t prove-website-robot .

docker run -it --rm -v .:/test-prove-website prove-website-robot bash -c "robot --outputdir output tasks/tasks.robot""
```

Robocorp rcc:
```
rcc run tasks/tasks.robot
```
