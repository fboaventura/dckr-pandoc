FROM ubuntu:focal-20230126

ENV PANDOC_VERSION "2.9"

# To use apt-cacher-ng while building locally
# ADD files/deb-proxy.conf /etc/apt/apt.conf.d/10-proxy

# Set to Non-Interactive
ENV DEBIAN_FRONTEND noninteractive
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

# Install all TeX and LaTeX dependences
RUN apt-get update \
  && apt-get install --yes --no-install-recommends \
    wget \
    make \
    git \
    ca-certificates \
    locales \
  && echo "en_US.UTF-8 UTF-8" > /etc/locale.gen \
  && locale-gen \
  && apt-get install --yes --no-install-recommends \
    lmodern \
    texlive-latex-base \
    texlive-fonts-recommended \
    texlive-generic-recommended \
    texlive-lang-english \
    texlive-lang-german \
    texlive-science \
    texlive-latex-extra \
    texlive-bibtex-extra \
    biber \
    fontconfig \
    texlive-xetex \
  && wget https://github.com/jgm/pandoc/releases/download/${PANDOC_VERSION}/pandoc-${PANDOC_VERSION}-1-amd64.deb -O /pandoc.deb \
  && dpkg -i /pandoc.deb \
  && apt -f install \
  && fc-cache -v -f \
  && apt-get autoclean \
  && apt-get --purge --yes autoremove \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/* /pandoc.deb

COPY fonts/* /usr/share/fonts/
COPY files/entrypoint.sh /entrypoint.sh

# Export the output data
WORKDIR /data
VOLUME ["/data"]

ENTRYPOINT ["/entrypoint.sh"]

LABEL org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.name="Pandoc" \
      org.label-schema.description="Pandoc" \
      org.label-schema.url="https://frederico.cf" \
      org.label-schema.vcs-url=$VCS_URL \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.version=${PANDOC_VERSION} \
      org.label-schema.schema-version="1.0" \
      org.label-schema.author="Frederico Freire Boaventura" \
      org.label-schema.docker.dockerfile="/Dockerfile" \
      org.label-schema.license="LGPLv3"

