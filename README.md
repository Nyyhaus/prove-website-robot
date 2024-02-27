Robotframework script to test various features of Prove Expertise Oy website.

```
wsl docker build -t prove-website-robot .

wsl docker run -it --rm -v .:/my-project prove-website-robot bash -c "robot --outputdir /output tests/tasks.robot"
```