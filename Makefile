# Makefile for Application
.DEFAULT_GOAL := all
.PHONY: all build clean run-webapp
SHELL = /usr/bin/env bash

# Variables
APP_NAME = Playground
SRC_DIR = $(shell pwd)
BIN_DIR = $(SRC_DIR)/bin
SRC_FILES = $(wildcard cmd/Main/*.go)
BIN_FILE = $(BIN_DIR)/$(APP_NAME)

# All target
all: build
	@echo "Creating application directory..."
	@mkdir -p \
		Common/Packages/com.cyber.Model/ \
		Common/Packages/com.cyber.Feature/ \
		Common/Packages/com.cyber.Example/ || { echo "Failed to create directories"; exit 1; }
	@tree --version > /dev/null 2>&1 || { \
			echo "Run 'tree $(shell pwd)/Common' error: command not found."; \
			echo "Please install tree command (command: 'sudo apt-get update && sudo apt install -y tree') to see the directory structure."; \
			exit 1; \
		}
	@tree ./Common
	@echo "Run application..." && exec $(BIN_FILE)

# Build target
build: $(SRC_FILES)
	@echo "Building application..."
	@mkdir -p $(BIN_DIR)
	@export CGO_ENABLED=0;\
		go build -ldflags "-extldflags \"-static\" -s -w -X playground.BuildDate=$(shell date -u +'%Y-%m-%dT%H:%M:%SZ')" \
			-o $(BIN_FILE) \
			$(SRC_FILES) || { echo "Failed to build application"; exit 1; }
	@echo "Build application successfully"

# Clean target
clean:
	@echo "Cleaning up..."
	@rm -rf $(BIN_DIR)

# Run webapp target
run-webapp:
	@echo "Running web application..."
	@go run Examples/WebApp/main.go -dir=./Examples/WebApp/ -port=3000

