build-x84_64:
	docker build \
		--tag doom-x86_64 \
		--progress=plain \
		--file ./x86_64.Dockerfile \
		.

run-x84_64: build-x84_64
	docker run \
		--rm -it \
		--name doom-x86_64 \
		doom-x86_64

build-i386:
	docker build \
		--tag doom-i386 \
		--progress=plain \
		--file ./i386.Dockerfile \
		.

run-i386: build-i386
	docker run \
		--rm -it \
		--name doom-i386 \
		doom-i386

run:	run-x84_64
