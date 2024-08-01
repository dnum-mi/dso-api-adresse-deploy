FROM alpine:3.20

RUN apk add wget unzip aws-cli

COPY app/dataloader.sh ./dataloader.sh

ENTRYPOINT [ "./dataloader.sh" ]