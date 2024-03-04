Robotframework script to automate various features of Prove Expertise Oy website.

If on windows and using wsl:
```
wsl docker build -t prove-website-robot .

wsl docker run -it --rm -v .:/test-prove-website prove-website-robot-slim_buster bash -c "robot --outputdir output tasks/tasks.robot"
```

On Linux:
```
docker build -t prove-website-robot .

docker run -it --rm -v .:/test-prove-website prove-website-robot-slim_buster bash -c "robot --outputdir output tasks/tasks.robot""
```

Robocorp rcc:
```
rcc run tasks/tasks.robot
```

In Vscode the robot can be started from the robocorp extension.

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