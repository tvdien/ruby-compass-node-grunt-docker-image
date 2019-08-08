FROM ruby:2.4.0 as for_compass
FROM node:0.12.18

ENV FRONTEND_SOURCE_PATH /data/frontend_src

COPY --from=for_compass /usr/local/bin/ /usr/local/bin/
COPY --from=for_compass /usr/local/etc/ /usr/local/etc/
COPY --from=for_compass /usr/local/include/ /usr/local/include/
COPY --from=for_compass /usr/local/lib/ /usr/local/lib/

RUN gem install compass

RUN npm install -g grunt-cli grunt

RUN echo '#!/usr/bin/env bash \n\
cd $FRONTEND_SOURCE_PATH \n\
npm install \n\
grunt $1 \n\
' >> /up_script.sh
RUN chmod +x /up_script.sh

ENTRYPOINT ["/up_script.sh"]
CMD ["build-development"]
