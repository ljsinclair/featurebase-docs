# Local build with Docker

## Before you begin

* Install [Docker Desktop](https://www.docker.com/get-started/)
* [Learn about Docker build](https://docs.docker.com/engine/reference/commandline/build/){:target="_blank"}
* Open Docker Desktop to start the daemon

NOTE: There are undoubtedly other methods of setting up Docker, however this way definitely works.

## Load Docker container from Dockerfile

Perform this action once for each container.

`Dockerfile` and `docker-compose.yml` can be found in the root directory.

NOTE: This process can take some time if starting from scratch or after executing `docker system prune -a`

1. Open a CLI then the `/featurebase-docs` directory

2. Load the container

| OS | CLI | Command
|---|---|
| Windows | Powershell | `Get-Content Dockerfile | docker build -` |
| Linux | Bash | `docker build - < Dockerfile` |
| Mac | Terminal | `docker build - < Dockerfile` |

## Serve the container

NOTE: Changes to configuration files such as `/_config.yml` are not loaded while the site is up.

* Run the the following in the `/featurebase-docs` directory:

```
docker compose up serve
```

## View local site

To view the local site on port `4000` head to:

http://localhost:4000/ or
http://<local-ip>:4000

## Editing content

**IMPORTANT** Read the Writing content guidance under this folder.

Content is found in the `/docs` and `/_includes` directories.

Edits to these files are loaded automatically by the system.

NOTE: Changes to configuration files such as `/_config.yml` or GIT PULL require the server to be restarted

## Restart the container to make changes

You will need to stop the container:
* to pull changes from remote
* when changes are made to configuration files such as `/_config.yml`

* Stop the server with `CTRL+C` on the CLI
* Serve the container with `docker compose up serve` when you are ready.

## Deleting containers and images

Containers and images can be deleted from Docker Desktop if required or via the command line.

* [Remove docker images, containers, volumes and networks](https://www.digitalocean.com/community/tutorials/how-to-remove-docker-images-containers-and-volumes)

## Further information

* [Check for broken links](https://github.com/FeatureBaseDB/featurebase-docs/blob/main/help-on-help/broken-link-check.md)
