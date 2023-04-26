FROM node:14.17.0

#Update stretch repositories
RUN sed -i s/deb.debian.org/archive.debian.org/g /etc/apt/sources.list
RUN sed -i 's|security.debian.org|archive.debian.org/|g' /etc/apt/sources.list
RUN sed -i '/stretch-updates/d' /etc/apt/sources.list

RUN apt update
RUN apt -y install git python3 build-essential
RUN npm i -g --force yarn
RUN npm i -g --force typescript
RUN npx tsc -v

COPY "entrypoint.sh" "/entrypoint.sh"
ENTRYPOINT ["/entrypoint.sh"]
CMD ["help"]
