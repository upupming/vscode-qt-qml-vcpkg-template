# vscode-qt-qml-vcpkg-template

We use the manifest mode `vcpkg.json` to declare dependencies, just like `package.json` for npm. Clone the repo and vcpkg using:

```bash
git clone --recurse-submodules https://github.com/upupming/vscode-qt-qml-vcpkg-template.git
```

## Advantages

- Debugging, Intelligence & Code formatting on VSCode is much more faster
- Run `windeploy` on the fly.
- Automatically build Release zip with GitHub Actions.

## Disadvantages

- VSCode CMake build is slower than Qt Creator, however, you can use both VSCode and Qt Creator at the same time, just take the essence and discard the dregs.
    - If you [start VSCode in "x64 Native Tools Command Prompt for VS 2019"](https://code.visualstudio.com/docs/cpp/config-msvc), it will be much faster to run the configure and build task, because they [don't need to setup `vcvars64.bat`](.scripts/build.bat) any more.
- No QML intelligence on VSCode, you can still use Qt Creator to write QML files.

## Getting started

1. Clone the repo.
2. Install latest visual studio 2019 with msvc compiler.
3. [Download Qt Installer](https://www.qt.io/download-open-source) and install latest Qt (current is `5.15.2` & `msvc2019_64`). qt5 installed with vcpkg [cannot build QML app](https://github.com/microsoft/vcpkg/issues/16983) now, so we manually install Qt.
4. Run the [`CMake Configure` task](.vscode/tasks.json). (Don't use the CMake Tools' Configure command, which uses Visual Studio generator and is much more slower than Ninja.)
5. If you build the exe for **the first time**, you **must run [`Run windeploy` task](.vscode/tasks.json)** to copy all necessary Qt libraries to the exe folder. Or the exe will crash on launch!
6. Change the `main.cpp` and use `F5` or debug button on the left side bar to see the results. VSCode will run CMake to build the exe on each debug session.
    - We use [`CMake Build` task](.vscode/tasks.json) to build the exe.
