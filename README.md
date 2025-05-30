+++
title = "Software install instructions and material"
+++

# GridapDD29Workshop

*Latest update: 27/11/2023*

The practical part of the workshop will consist of instructors' guided hands-on tutorials and exercises. You will find below the instructions to set up the software environment required to run the tutorials.

**NOTE**: In the case you have any issues while following these instructions, please fill an issue [here](https://github.com/gridap/GridapDD29Workshop/issues) and we will try to help you out. This will also help other participants that may have the same issue.

## Required software

Before being able to work on the workshop material, you will need to install the following software on your laptop:

- Install [git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git), the version control system we will use. **For Windows users, we strongly recommend installing [git for Windows](https://gitforwindows.org/). This will also install a bash shell, which will allow you to follow the rest of the installation instructions verbatim.**
- Download and install Julia based on the platform you are using from the [Julia](https://julialang.org/downloads/platform/) home page.
- Download and install VSCode based on the platform you are using from the [VSCode](https://code.visualstudio.com/download) home page. 
- [Install](https://www.julia-vscode.org/docs/dev/gettingstarted/#Installing-the-Julia-extension) and [configure](https://www.julia-vscode.org/docs/dev/gettingstarted/#Configuring-the-Julia-extension) the [Julia extension for VSCode](https://code.visualstudio.com/docs/languages/julia). Some interesting features of the Julia extension for VSCode are covered in the following [YouTube](https://www.youtube.com/watch?v=IdhnP00Y1Ks&t=125s) video.
- Install [ParaView](https://www.paraview.org/download/) post-processing software. We will use the basic features of ParaView. In any case, if you are 
  keen on learning more,  there is a whole [YouTube channel](https://www.youtube.com/playlist?list=PLvkU6i2iQ2fpcVsqaKXJT5Wjb9_ttRLK-) on ParaView that will give you many more ideas. 
- Finally, you will need an **ssh** client to connect to Gadi. Generally, every modern OS should have one installed by default. To check if you have one, open a terminal and type `ssh`. If a message like `usage: ssh ...` appears, you are good to go.

## Getting the workshop material

The workshop material is available as a git repository [here](https://github.com/gridap/GridapDD29Workshop). You can either download it as a zip file or clone the repository using git. We strongly recommend the latter as you will be able to automatically pull the most up-to-date changes as per required.

If your system has an ssh client, you can clone the repository using the following command

```bash
git clone git@github.com:gridap/GridapDD29Workshop.git
```

from the terminal. In order this command to be successful, you will need to generate a pair of public/private SSH keys, and then associate the public key to your GitHub account. You may find some instructions on how to do this [here](https://github.com/MonashMath/SCI1022/blob/master/Git.md#182-connecting-to-github-with-ssh-keys). If, for whatever reason, you are not able to succeed, you may also try:

```bash
git clone https://github.com/gridap/GridapDD29Workshop.git
```

which does not require the aforementioned pair of public/private SSH keys.

Alternative methods to clone the repository can be found [here](https://docs.github.com/en/repositories/creating-and-managing-repositories/cloning-a-repository).

Once you have cloned the repository, you can pull the most up-to-date changes with the following command executed from the root directory of the repository:

```bash
git pull origin
```

You may expect changes in the tutorials and exercises till the very last minute. These instructions are mostly definitive, though.

## Setting up the environment on your local computer from the terminal

Move into the newly cloned repository and start Julia from the terminal by typing

```bash
julia --project=.
```

Then, press `]` to enter the package manager and run

```julia
(DD29) pkg> instantiate
(DD29) pkg> update
(DD29) pkg> build
```

to install and precompile all the packages needed for the workshop. This may take a while.

To render Jypyter notebooks interactively, you also need to run the following:

```bash
  julia -e'using Pkg; Pkg.add("IJulia")'
```

More information on Julia Environments can be found [here](https://pkgdocs.julialang.org/v1/environments/).

## Setting up the environment on your local computer with VSCode

1. Open VSCode. Then, on the top menu, select `File->Open Folder`, and select the workshop's material folder you just cloned.
2. Ensure that the Julia environment in the bottom status bar of VSCode is `DD29`. Click [here](https://www.julia-vscode.org/docs/dev/userguide/env/#Julia-Environments) for instructions on how to do that.
3. Open the Julia REPL in VSCode. To this end, open the command palette with the keyboard key combination `Crtl+Shift+P`.
4. On the command palette, type `"julia"`. You should get a drop-down list with different options. Select `Julia: Start REPL` option. This should open the Julia REPL on the VSCode's terminal window at the bottom.
5. Run the `instantiate` package manager command as described in the previous section.
