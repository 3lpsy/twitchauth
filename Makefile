ROOT_DIR:=$(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

BIN_DIR=bin
TARGET=main.go
BINARY=twitchtoken
VERSION=1.0.1
BUILD=`git rev-parse HEAD`
PLATFORMS=darwin linux windows
ARCHITECTURES=386 amd64

# Setup linker flags option for build that interoperate with variable names in src code
LDFLAGS=-ldflags "-X main.Version=${VERSION} -X main.Build=${BUILD}"

default: build

all: clean deps build

build:
	go build ${LDFLAGS} -o ${BIN_DIR}/${BINARY} ${TARGET}

build-all:
	$(foreach GOOS, $(PLATFORMS),\
	$(foreach GOARCH, $(ARCHITECTURES),\
	$(shell export GOOS=$(GOOS); export GOARCH=$(GOARCH); go build -o $(BIN_DIR)/$(BINARY)-$(GOOS)-$(GOARCH) $(TARGET))))

install:
	go install ${LDFLAGS}

deps:
	go get github.com/gorilla/sessions
	go get golang.org/x/oauth2
	go get golang.org/x/oauth2/twitch

# Remove only what we've created
clean:
	rm -f "${ROOT_DIR}/${BIN_DIR}/*"

.PHONY: check clean install build-all all
