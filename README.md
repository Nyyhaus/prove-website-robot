Robotframework script to automate various features of Prove Expertise Oy website.

If on windows and using wsl:
```
wsl docker build -t prove-website-robot .

wsl docker run -it --rm -v .:/tests prove-website-robot bash -c "robot --outputdir /output tests/tasks.robot"
```

On Linux:
```
docker build -t prove-website-robot .

docker run -it --rm -v .:/tests prove-website-robot bash -c "robot --outputdir /output tests/tasks.robot"
```

# Template: Robot Framework - Minimal

This is the simplest template to start from.

- Get started from a simple task template in `tasks.robot`.
  - Uses [Robot Framework](https://robocorp.com/docs/languages-and-frameworks/robot-framework/basics) syntax.
- You can configure your robot `robot.yaml`.
- You can configure dependencies in `conda.yaml`.

## Learning materials

- [Robocorp Developer Training Courses](https://robocorp.com/docs/courses)
- [Documentation links on Robot Framework](https://robocorp.com/docs/languages-and-frameworks/robot-framework)
- [Example bots in Robocorp Portal](https://robocorp.com/portal)