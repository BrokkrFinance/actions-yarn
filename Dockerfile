FROM node:14.17.0

RUN apt update
RUN apt -y install git python3 build-essential
RUN npm i -g --force yarn
COPY "entrypoint.sh" "/entrypoint.sh"
ENTRYPOINT ["/entrypoint.sh"]
CMD ["help"]
