#!/bin/bash
CURRENT_DIR=$(cd $(dirname $0); pwd)
# shellcheck disable=SC2206
PROTOBUF_DIR=($CURRENT_DIR/protobuf)
# shellcheck disable=SC2206
GRPC_GO_DIR=($CURRENT_DIR/grpc-go)
# shellcheck disable=SC2128
# shellcheck disable=SC2115
rm -rf "$GRPC_GO_DIR"/*

# shellcheck disable=SC2128
files=$(ls "$PROTOBUF_DIR")
for filename in $files
do
    protoc --go_out=plugins=grpc:"$CURRENT_DIR"/grpc-go --proto_path="$CURRENT_DIR"/ "$PROTOBUF_DIR"/"$filename"
done