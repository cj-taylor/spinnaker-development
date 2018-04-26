# spinnaker development

## Overview

Scripting out most of the path to development on the moving parts for spinnaker.

After following the [`Setup`](#setup), the necessary repositories will be available in `spinnaker-development/repos/*`

## Setup

- Clone this repo
- Fork spinnaker repos for development
  - https://www.spinnaker.io/reference/architecture/#spinnaker-microservices
- Create Github SSH key as `~/.ssh/github_com_rsa` for automated cloning
- Set environment variables (used by the [`localgit installation`](https://www.spinnaker.io/setup/install/environment/#local-git))
```shell
export github_com_user=your-username
export github_com_user_name="Your Name"
export github_com_user_email="your@email.com"
```
- `./develop.sh`

## Links

- [`Setup - Local via Docker`](https://www.spinnaker.io/setup/install/halyard/#docker)
- [`Setup - Local git config`](https://www.spinnaker.io/setup/install/environment/#local-git)
- [`Life of a bake`](https://www.spinnaker.io/reference/architecture/loab/)
- [`Life of a deployment`](https://www.spinnaker.io/reference/architecture/load/)
