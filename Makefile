image_name = sedatif
pwd = $(shell pwd)

all: easy

easy:
	sudo docker run \
	-i \
	--network=host \
	--rm \
	-v $(pwd):/data \
	mribeiro/xmllint \
	--schema ./resources/SEDA_2.1/seda-2.1-main.xsd \
	--noout \
	./invoice/*

run: build
	sudo docker run \
		-it \
		--network=host \
		--mount type=bind,source=$(pwd)/invoice,target=/mnt,readonly \
		$(image_name):dev

build: clean
	sudo docker build \
			--network=host \
			--target=dev \
			--tag=$(image_name):dev \
			.

clean:
	sudo docker container prune -f

