FROM golang:latest as gotapdance_base
ENV CGO_ENABLED=0
RUN go get github.com/refraction-networking/gotapdance/... &&\
    go build ... 
RUN git clone https://github.com/refraction-networking/gotapdance.git

FROM alpine:latest
VOLUME /gotapdance/assets
COPY --from=gotapdance_base /go/bin/clientconf /gotapdance/clientconf
COPY --from=gotapdance_base /go/bin/cli /gotapdance/cli
COPY --from=gotapdance_base /go/gotapdance/assets /gotapdance/original_assets
COPY entrypoint.sh /gotapdance/entrypoint.sh
RUN chmod +x /gotapdance/entrypoint.sh
WORKDIR /gotapdance
ENTRYPOINT ["/gotapdance/entrypoint.sh"]
CMD ["./cli","-connect-addr=ident.me:443"]
