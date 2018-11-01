FROM node:8.12.0

ARG container_user_id

RUN useradd --shell /bin/bash -u $container_user_id -o -c "" -m user-in-container

RUN mkdir -p /s_vue_2nd/src && mkdir -p /ext/node_modules

ADD ./package.json /s_vue_2nd
RUN cd /s_vue_2nd && yarn install --network-timeout 80000

RUN yarn global add package-json-merge --network-timeout 80000

ADD ./ /s_vue_2nd

ADD ./entryfiles/entry.sh /entry.sh

RUN chown -R user-in-container:user-in-container /s_vue_2nd /ext && chmod +x /entry.sh
USER user-in-container

WORKDIR /s_vue_2nd/src
