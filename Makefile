OUT_DIR=build
PROTO_ROOT=sdk
PROTO_FILES=$(shell find $(PROTO_ROOT) -name '*.proto')

# Go-specific settings
GO_OUT=$(OUT_DIR)/go
GO_MODULE=github.com/tarmac-project/protobuf-go
PROTOC_INCLUDES=-I=$(PROTO_ROOT)

.PHONY: build clean go

build: go

go: $(PROTO_FILES)
	@echo "Generating Go code..."
	mkdir -p $(GO_OUT)/$(GO_MODULE)
	protoc $(PROTOC_INCLUDES) \
		--plugin protoc-gen-go-lite="$(GOPATH)/bin/protoc-gen-go-lite" \
		--go-lite_out=paths=import:$(GO_OUT) \
		--go-lite_opt=features=marshal+unmarshal+size+equal+clone \
		$(PROTO_FILES)

clean:
	@echo "Cleaning up generated files..."
	rm -rf $(OUT_DIR)
