FROM alpine:3.20

RUN apk add wget unzip aws-cli

COPY app/dataloader.sh ./dataloader.sh
COPY app/datadl.sh ./datadl.sh

RUN chmod +x ./dataloader.sh
RUN chmod +x ./datadl.sh

USER 1515

ENTRYPOINT [ "./dataloader.sh" ]