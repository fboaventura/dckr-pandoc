# fboaventura/dckr-pandoc

[![GitHub issues](https://img.shields.io/github/issues/fboaventura/dckr-pandoc)](https://github.com/fboaventura/dckr-pandoc/issues) [![GitHub forks](https://img.shields.io/github/forks/fboaventura/dckr-pandoc)](https://github.com/fboaventura/dckr-pandoc/network) [![GitHub stars](https://img.shields.io/github/stars/fboaventura/dckr-pandoc)](https://github.com/fboaventura/dckr-pandoc/stargazers) [![GitHub license](https://img.shields.io/github/license/fboaventura/dckr-pandoc)](https://github.com/fboaventura/dckr-pandoc) [![Docker Hub Size](https://images.microbadger.com/badges/image/fboaventura/dckr-pandoc.svg)](https://microbadger.com/images/fboaventura/dckr-pandoc) [![Docker Hub Version](https://images.microbadger.com/badges/version/fboaventura/dckr-pandoc.svg)](https://microbadger.com/images/fboaventura/dckr-pandoc)

Docker instance to work with documents conversion and LaTeX editing, using [Pandoc](https://github.com/jgm/pandoc/).  I've built this instance mostly to work with [CV-Boilerplate] and get a smaller footprint than the one recommended on the README there.

## How to use it

If you are using the [CV-Boilerplate] or if you have a `Makefile` on your folder, It's as simple as running:

```(shell)
docker run -it --name pandoc --rm -v `pwd`:/data fboaventura/dckr-pandoc
```

Since the image has `make` as the default command, if there is a `Makefile` present, it will bring the container up, run the `make` command and remove the container.  If there is no `Makefile` present, it will run `pandoc` by default, so you need to add the parameters to be used by `pandoc`.

There is also the possibility of running the container interactively, running `sh` or `bash` shells:

```(shell)
docker run -it --name pandoc --rm -v `pwd`:/data fboaventura/dckr-pandoc /bin/sh
```

or

```(shell)
docker run -it --name pandoc --rm -v `pwd`:/data fboaventura/dckr-pandoc /bin/bash
```

## Fonts

All the fonts added to this image are licensed under the [Open Font License](http://scripts.sil.org/cms/scripts/page.php?site_id=nrsi&id=OFL_web), except for Roboto, that is licensed through [Apache License v2.0](http://www.apache.org/licenses/LICENSE-2.0).

The container is distributed as is and no liability is held due to it's usage.

[CV-Boilerplate]: https://gitlab.com/dimitrieh/curriculumvitae-ci-boilerplate
