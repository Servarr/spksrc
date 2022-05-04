## Contributing
Before opening a new issue, check the [FAQ] and search open issues.
If you can't find an answer, or if you want to open a package request, read [CONTRIBUTING] to make sure you include all the information needed for contributors to handle your request.


## Setup Development Environment
### Docker
*The Docker development environment supports Linux and macOS systems, but not Windows due to limitations of the underlying file system.*

1. [Fork and clone] spksrc: `git clone https://github.com/YOUR-USERNAME/spksrc`
2. Install Docker on your host OS (see [Docker installation], or use a `wget`-based alternative for linux [Install Docker with wget]).
3. Download the spksrc Docker container: `docker pull ghcr.io/synocommunity/spksrc`
4. Run the container with the repository mounted into the `/spksrc` directory with the appropriate command for your host Operating System:

```bash
cd spksrc # Go to the cloned repository's root folder.

# If running on Linux:
docker run -it -v $(pwd):/spksrc ghcr.io/synocommunity/spksrc /bin/bash

# If running on macOS:
docker run -it -v $(pwd):/spksrc -e TAR_CMD="fakeroot tar" ghcr.io/synocommunity/spksrc /bin/bash
```
5. From there, follow the instructions in the [Developers HOW TO].

## Usage
Once you have a development environment set up, you can start building packages, create new ones, or improve upon existing packages while making your changes available to other people.
See the [Developers HOW TO] for information on how to use spksrc.


## License
When not explicitly set, files are placed under a [3 clause BSD license]

[3 clause BSD license]: http://www.opensource.org/licenses/BSD-3-Clause
[bug tracker]: https://github.com/Servarr/spksrc/issues
[CONTRIBUTING]: https://github.com/Servarr/spksrc/blob/master/CONTRIBUTING.md
[Fork and clone]: https://docs.github.com/en/github/getting-started-with-github/fork-a-repo
[Developers HOW TO]: https://github.com/Servarr/spksrc/wiki/Developers-HOW-TO
[Docker installation]: https://docs.docker.com/engine/installation
[FAQ]: https://github.com/Servarr/spksrc/wiki/Frequently-Asked-Questions
[Install Docker with wget]: https://docs.docker.com/linux/step_one
