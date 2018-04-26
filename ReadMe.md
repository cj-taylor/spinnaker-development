# spinnaker development

## Links

- [`Setup - Local via Docker`](https://www.spinnaker.io/setup/install/halyard/#docker)
- [`Setup - Local git config`](https://www.spinnaker.io/setup/install/environment/#local-git)
- [`Life of a bake`](https://www.spinnaker.io/reference/architecture/loab/)
- [`Life of a deployment`](https://www.spinnaker.io/reference/architecture/load/)

## Steps

- Clone repo
- Set environment variables
```shell
export github_com_user=your-username
export github_com_user_name="Your Name"
export github_com_user_email="your@email.com"
```
- Create Github SSH key as `~/.ssh/github_com_rsa` for automated cloning
- `./develop.sh`
