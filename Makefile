OUT_DIR=build
PROTO_ROOT=sdk
PROTO_FILES=$(shell find $(PROTO_ROOT) -name '*.proto')

# Go-specific settings
GO_OUT=$(OUT_DIR)/go/sdk
PROTOC_INCLUDES=-I=$(PROTO_ROOT)

.PHONY: all clean go

all: go

go: $(PROTO_FILES)
	@echo "Generating Go code..."
	mkdir -p $(GO_OUT)
	protoc $(PROTOC_INCLUDES) \
		--go_out=$(GO_OUT) \
		--go_opt=paths=source_relative \
		--go-vtproto_out=$(GO_OUT) \
		--go-vtproto_opt=paths=source_relative \
		--plugin protoc-gen-go="${GOPATH}/bin/protoc-gen-go" \
		--plugin protoc-gen-go-vtproto="${GOPATH}/bin/protoc-gen-go-vtproto" \
		$(PROTO_FILES)

clean:
	@echo "Cleaning up generated files..."
	rm -rf $(OUT_DIR)
