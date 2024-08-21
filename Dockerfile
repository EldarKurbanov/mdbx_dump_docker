FROM gcc:14 AS mdbx_tools

WORKDIR /root
RUN git clone --depth 1 --branch v0.12.11 https://gitflic.ru/project/erthink/libmdbx.git
WORKDIR /root/libmdbx

RUN make tools-static

FROM scratch AS mdbx_dump

USER 1001:1001

COPY --from=mdbx_tools /root/libmdbx/mdbx_dump.static /bin/mdbx_dump
ENTRYPOINT ["/bin/mdbx_dump"]

FROM scratch AS mdbx_load

USER 1001:1001

COPY --from=mdbx_tools /root/libmdbx/mdbx_load.static /bin/mdbx_load
ENTRYPOINT ["/bin/mdbx_load"]
