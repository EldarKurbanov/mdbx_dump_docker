FROM gcc:14

WORKDIR /root
RUN git clone --depth 1 --branch v0.12.11 https://gitflic.ru/project/erthink/libmdbx.git
WORKDIR /root/libmdbx

RUN make mdbx_dump

FROM scratch
COPY --from=0 /root/libmdbx/mdbx_dump /bin/mdbx_dump
CMD ["/bin/mdbx_dump"]