FROM alpine:3.20

RUN apk add wget unzip aws-cli ruby

RUN gem install aws-sdk-s3 rexml

COPY app/dataloader.sh ./dataloader.sh
COPY app/datadl.sh ./datadl.sh
COPY app/datadl-chunk.rb ./datadl-chunk.rb

RUN chmod +x ./dataloader.sh
RUN chmod +x ./datadl.sh
RUN chmod +x ./datadl-chunk.rb

USER 1515

ENTRYPOINT [ "./dataloader.sh" ]