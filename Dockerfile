# NOTE: needs to match base/yarn.sh
FROM node:8.11.3

ARG container_user_id
ARG is_dev

RUN useradd --shell /bin/bash -u $container_user_id -o -c "" -m user-in-container

# install vim to help testing inside container
RUN if [ "$is_dev" = "true" ]; then apt-get update && apt-get install -y vim; fi

RUN mkdir -p /s_vue_2nd/src && mkdir -p /ext/node_modules

RUN yarn global add package-json-merge --network-timeout 80000

ADD ./base /s_vue_2nd
ADD ./scripts/entry.sh /entry.sh

RUN chown -R user-in-container:user-in-container /s_vue_2nd /ext && chmod +x /entry.sh

USER user-in-container

RUN cd /s_vue_2nd && tar xjof node_modules.tar.bz2

WORKDIR /s_vue_2nd/src
