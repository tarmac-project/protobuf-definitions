# Tarmac Protobuf Definitions

This repository contains the protobuf definitions for the Tarmac project.

The protobuf definitions are used by Tarmac SDKs or functions directly to perform host calls to the Tarmac server.
Communication between the Tarmac server and functions/SDKs is via [waPC](https://wapc.io/) WebAssembly Procedure Calls.

## Structure

| Proto File | Description |
|------------|-------------|
| `tarmac.proto` | Contains common messages used for various message types. |
| `kvstore.proto` | Protobuf definitions for KVStore related messages. |
| `metrics.proto` | Protobuf definitions for Metrics related messages. |
| `http.proto` | Protobuf definitions for HTTP client related messages. |
| `sql.proto` | Protobuf definitions for SQL query related messages. |

## Contributing

Contributions are  welcome please open an issue or submit a pull request for any changes or improvements.
