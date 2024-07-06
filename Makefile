build-x84_64:
	docker build \
		--tag doom-x86_64 \
		--progress=plain \
		--file ./x86_64.Dockerfile \
		.

run-x84_64:	build-x84_64
	docker run \
		--rm -it \
		--name doom-x86_64 \
		--publish 8900:5900 \
		doom-x86_64

build-i386:
	docker build \
		--tag doom-i386 \
		--progress=plain \
		--file ./i386.Dockerfile \
		.

run-i386:	build-i386
	docker run \
		--rm -it \
		--name doom-i386 \
		--publish 8900:5900 \
		--volume=./output/:/output/ \
		doom-i386

run:	run-x84_64
