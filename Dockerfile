FROM ubuntu:latest AS downloader
WORKDIR /tmp

RUN apt-get update && \
    apt-get install -y curl xz-utils ca-certificates && \
    rm -rf /var/lib/apt/lists/*

RUN curl -L https://factorio.com/get-download/stable/headless/linux64 \
    --output factorio.tar.xz && \
    tar -xJf factorio.tar.xz


FROM ubuntu:latest
WORKDIR /opt/factorio

ARG SAVE_FILE
ENV SAVE_FILE=$SAVE_FILE

COPY --from=downloader /tmp/factorio .

RUN useradd factorio && chown -R factorio:factorio .
USER factorio

EXPOSE 34197/udp
CMD bin/x64/factorio --start-server "$SAVE_FILE" --server-settings data/server-settings.json
