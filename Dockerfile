FROM rust:1.44-buster AS builder

RUN apt update
RUN apt install -y make git bash jq opencl-headers libclang-dev
WORKDIR /
ADD ./fil-blst ./fil-blst/
ADD ./filecoin-ffi ./filecoin-ffi/
RUN cd filecoin-ffi && make && cd ../

FROM golang:1.14.4-buster AS builder-verifier

RUN apt update
RUN apt install -y pkg-config gcc mesa-opencl-icd ocl-icd-opencl-dev 
WORKDIR /verifier
COPY --from=builder /filecoin-ffi ./filecoin-ffi/
COPY --from=builder /fil-blst ./fil-blst/
ADD *.go ./
ADD go.mod go.sum ./
RUN go build -o /app .

ENTRYPOINT /app
