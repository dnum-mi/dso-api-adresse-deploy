FROM alpine:3.20

RUN apk add wget unzip aws-cli

COPY dataloader.sh ./dataloader.sh

ENTRYPOINT [ "./dataloader.sh" ]