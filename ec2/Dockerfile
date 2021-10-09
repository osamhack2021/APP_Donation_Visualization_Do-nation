# See here for image contents: https://github.com/microsoft/vscode-dev-containers/tree/v0.191.1/containers/codespaces-linux/.devcontainer/base.Dockerfile

FROM node:16-alpine3.11

USER root

WORKDIR /server

RUN npm install
RUN npm run build
CMD ["npm", "start"]
