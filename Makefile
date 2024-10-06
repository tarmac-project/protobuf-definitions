OUT_DIR=build

# Go-specific settings
GO_OUT=$(OUT_DIR)/go

.PHONY: build clean go

build: go

go:
	@echo "Generating Go code..."
	mkdir -p $(GO_OUT)
	@echo "Generating SDK..."
	protoc -I=./sdk --go_out=$(GO_OUT) --go-vtproto_out=$(GO_OUT) --plugin protoc-gen-go="${GOPATH}/bin/protoc-gen-go" --plugin protoc-gen-go-vtproto="${GOPATH}/bin/protoc-gen-go-vtproto" ./sdk/*.proto

clean:
	@echo "Cleaning up generated files..."
	rm -rf $(OUT_DIR)

