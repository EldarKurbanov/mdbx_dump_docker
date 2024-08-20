docker build -t eldarkurbanov/mdbx_dump:v0.12.11 -t eldarkurbanov/mdbx_dump --platform=linux/amd64,linux/arm/v5,linux/arm/v7,linux/arm64/v8,linux/ppc64le,linux/s390x .
docker push eldarkurbanov/mdbx_dump:v0.12.11
docker push eldarkurbanov/mdbx_dump