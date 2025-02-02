FROM node:16.14.0-buster

LABEL version="1.2.4"
LABEL repository="https://github.com/indicava/firebase-action"
LABEL homepage="https://github.com/indicava/firebase-action"
LABEL maintainer="Elad Altstein <indicava@github.com>"

LABEL com.github.actions.name="GitHub Action for Firebase"
LABEL com.github.actions.description="Wraps the firebase-tools CLI to enable common commands."
LABEL com.github.actions.icon="package"
LABEL com.github.actions.color="gray-dark"

RUN wget -qO - https://adoptopenjdk.jfrog.io/adoptopenjdk/api/gpg/key/public | apt-key add -
RUN apt update && apt install -y software-properties-common
RUN add-apt-repository --yes https://adoptopenjdk.jfrog.io/adoptopenjdk/deb/
RUN apt update && apt install -y jq adoptopenjdk-8-hotspot-jre git && apt autoremove --purge -y && apt clean -y

RUN npm i -g npm@latest
RUN npm i -g firebase-tools@latest

COPY LICENSE README.md /
COPY "entrypoint.sh" "/entrypoint.sh"

ENTRYPOINT ["/entrypoint.sh"]
CMD ["--help"]
