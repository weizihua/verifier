
# OAuth Verifier backend

Docker build:

```sh
git submodule update --init
docker build -t openworklabs/verifier .
docker run -it \
    -e GITHUB_CLIENT_ID=... \
    -e GITHUB_CLIENT_SECRET=... \
    -e AWS_REGION=... \
    -e AWS_ACCESS_KEY=... \
    -e AWS_SECRET_KEY=... \
    -e LOTUS_API_DIAL_ADDR=... \
    -e LOTUS_API_TOKEN=... \
    -e LOTUS_VERIFIER_ADDR=... \
    -e MIN_ACCOUNT_AGE_DAYS=... \
    -e MAX_ALLOWANCE_BYTES=... \
    -p 8080:8080
verifier
```
