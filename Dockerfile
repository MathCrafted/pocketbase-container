FROM alpine:3.22.4

ENV PB_VERSION="0.38.0"
ENV IP_ADDR="0.0.0.0"
ENV PORT="8090"

RUN wget https://github.com/pocketbase/pocketbase/releases/download/v${PB_VERSION}/pocketbase_${PB_VERSION}_linux_amd64.zip \
    && unzip pocketbase_${PB_VERSION}_linux_amd64.zip \
    && rm CHANGELOG.md LICENSE.md pocketbase_${PB_VERSION}_linux_amd64.zip \
    && mv ./pocketbase /usr/bin \
    && mkdir -p /pb_data


EXPOSE 8090/tcp

CMD pocketbase serve --dir=/pb_data --http=${IP_ADDR}:${PORT}
