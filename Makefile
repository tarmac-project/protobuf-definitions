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
	mkdir -p $(GO_OUT)
	protoc $(PROTOC_INCLUDES) \
		--go_out=module=$(GO_MODULE):$(GO_OUT) \
		--go-vtproto_out=module=$(GO_MODULE):$(GO_OUT) \
		--plugin protoc-gen-go="${GOPATH}/bin/protoc-gen-go" \
		--plugin protoc-gen-go-vtproto="${GOPATH}/bin/protoc-gen-go-vtproto" \
		$(PROTO_FILES)

clean:
	@echo "Cleaning up generated files..."
	rm -rf $(OUT_DIR)
