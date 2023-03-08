# Building using Docker on Windows Subsystem for Linux

IMPORTANT: WSL2 will consume resources as it requires. There is no way to limit this. You may experience memory issues on the host machine if you run too many processes.

## Before you begin

* Install and set up on Windows host machine and Git:
  * Set up Git
  * Set up SSH keys
  * Clone featurebase-docs
* [Install Windows Terminal](https://learn.microsoft.com/en-us/windows/terminal/install)
* [Install WSL2]https://learn.microsoft.com/en-us/windows/wsl/install
* [Install Ubuntu on WSL2](https://ubuntu.com/tutorials/install-ubuntu-on-wsl2-on-windows-11-with-gui-support#1-overview)
* [Install Docker Desktop for Windows](https://www.docker.com/products/docker-desktop/)
* `ubuntu` is the WSL ubuntu installation. Alter as required

## Step 1 - install Docker

WARNING: Installation will fail if WSL1 is installed

| Purpose | Command |
|---|---|
| Verify WSL2 is installed | `wsl -l -v` |
| Install Docker on WSL | `curl https://get.docker.com/ | bash` |
| Mod user to use Docker without sudo | `usermod -aG docker <username>` |
| Shutdown Ubuntu from powershell | `wsl -t ubuntu` |

## Step 2 - start docker then mount local filesystem

NOTE: `service docker start` does not work and you need to start Docker Desktop instead

| Purpose | Command |
|---|---|
| Start Docker daemon | Host system > Start Docker Desktop |
| Start Ubuntu | UI > Open Ubuntu tab in Terminal app |
| Mount the host filesystem | `cd /mnt/c` |
| CD to featurebase-docs | `cd Users/<username>/<git-directory>/featurebase-docs` |
| Build the image | `docker build - < Dockerfile` |
| Serve Jekyll site | `docker compose up serve` |

## Step 3 - broken link check

In a new Ubuntu terminal perform these steps

| Purpose | Command |
|---|---|
| Mount the host filesystem | `cd /mnt/c` |
| CD to featurebase-docs | `cd Users/<username>/<git-directory>/featurebase-docs` |
| Get running container ID for `serve-jekyll-docs-fb` | `docker ps` |
| Open shell on running container ID | `docker exec -it <serve-jekyll-docs-fb container ID> /bin/bash` |
| Run broken link check | `exec htmlproofer ./_site` |

## Step 4 - cleanup

| Purpose | Command |
|---|---|
| Stop all running containers | `docker stop $(docker ps -a -q)` |
| Delete all containers | `docker rm $(docker ps -a -q)` |
| Verify containers deleted | `docker container ls` |
| Delete all images | `docker rmi -f $(docker images -a -q)` |
| Verify images deleted | `docker image ls` |

## Step 5 - Shutdown WSL2

| Purpose | Command |
|---|---|
| Stop WSL from powershell | `wsl -t ubuntu` |
