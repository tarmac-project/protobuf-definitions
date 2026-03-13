# Tarmac Protobuf Definitions

This repository contains the protobuf definitions for the Tarmac project.

The protobuf definitions are used by Tarmac SDKs or functions directly to perform host calls to the Tarmac server.
Communication between the Tarmac server and functions/SDKs is via [waPC](https://wapc.io/) WebAssembly Procedure Calls.

## Generation

The checked-in `.proto` files in this repository are the source of truth for
the generated Go packages published from
[`protobuf-go`](https://github.com/tarmac-project/protobuf-go).

Use `make build` to generate Go code with `protoc-gen-go-lite`. The generated
output is written under `build/go/github.com/tarmac-project/protobuf-go`.

## Structure

| Proto File | Description |
|------------|-------------|
| `tarmac.proto` | Contains common messages used for various message types. |
| `kvstore.proto` | Protobuf definitions for KVStore related messages. |
| `metrics.proto` | Protobuf definitions for Metrics related messages. |
| `http.proto` | Protobuf definitions for HTTP client related messages. |
| `sql.proto` | Protobuf definitions for SQL query related messages. |

## Contributing

Contributions are welcome, please open an issue or submit a pull request for any changes or improvements.
