.DEFAULT_GOAL := build

BUILD_TAG=neochrome/dropbox:latest

build:
	@docker build -t $(BUILD_TAG) .

debug:
	@docker run --rm -it --entrypoint /bin/sh $(BUILD_TAG) 

clean:
	@docker rmi -f $(BUILD_TAG)
