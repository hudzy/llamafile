#!/bin/bash
set -euo pipefail
cd $(dirname $0)

export LLAMAEDGE_VERSION='0.14.4'
export WASMEDGE_VERSION='0.14.1'
export MODEL_URL='https://huggingface.co/second-state/Meta-Llama-3.1-8B-GGUF/blob/main/Meta-Llama-3.1-8B-Q5_K_M.gguf'
export PROMPT_FORMAT='llama-3-chat'
export CONTEXT_SIZE=4096
export TEMPERATURE=0.7
export IMAGE_TAG=llama3.1-8b

docker buildx \
	build --no-cache --push \
	--build-arg MODEL_URL=$MODEL_URL \
	--build-arg PROMPT_FORMAT=$PROMPT_FORMAT \
	--build-arg CONTEXT_SIZE=$CONTEXT_SIZE \
	--build-arg TEMPERATURE=$TEMPERATURE \
	--platform linux/amd64 \
	-t hudzy/llamaedge:$IMAGE_TAG \
	-f Dockerfile .
