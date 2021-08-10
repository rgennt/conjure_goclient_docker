FROM golang:latest as gotapdance_base
ENV CGO_ENABLED=0
RUN go get github.com/refraction-networking/gotapdance/... &&\
    cd /go/src/github.com/refraction-networking/gotapdance/cli &&\
    go build . &&\
    cd /go/src/github.com/refraction-networking/gotapdance/tools/clientconf &&\
    go build .

FROM alpine:latest
VOLUME /gotapdance/assets
COPY --from=gotapdance_base /go/src/github.com/refraction-networking/gotapdance/tools/clientconf/clientconf /gotapdance/clientconf
COPY --from=gotapdance_base /go/src/github.com/refraction-networking/gotapdance/cli/cli /gotapdance/cli
COPY --from=gotapdance_base /go/src/github.com/refraction-networking/gotapdance/assets /gotapdance/original_assets
COPY entrypoint.sh /gotapdance/entrypoint.sh
RUN chmod +x /gotapdance/entrypoint.sh
WORKDIR /gotapdance
ENTRYPOINT ["/gotapdance/entrypoint.sh"]
CMD ["./cli","-connect-addr=ident.me:443"]
