#!/bin/bash
docker run --rm -it \
	--name 'clp-build-env' \
	-u root:root \
	-v /home/socke/workspace/clp/components/core:/mnt/clp \
	-v /home/socke/workspace/clp/logs:/mnt/logs \
	-v /home/socke/workspace/clp/schemas:/clp/schemas \
	-v /home/socke/workspace/clp/run-test.sh:/clp/run-test.sh \
	-v /home/socke/workspace/clp/components/core/config/schemas.txt:/clp/schemas/default-scheme.txt \
	ghcr.io/y-scope/clp/clp-core-x86-ubuntu-focal:main \
	/bin/bash

