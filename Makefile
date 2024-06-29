OUT_DIR=build

# Go-specific settings
GO_OUT=$(OUT_DIR)/go

.PHONY: all clean go

all: go

go:
	@echo "Generating Go code..."
	mkdir -p $(GO_OUT)
	protoc -I=./proto --go_out=$(GO_OUT) ./proto/*.proto

clean:
	@echo "Cleaning up generated files..."
	rm -rf $(OUT_DIR)

