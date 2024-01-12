/**
 * Holds meta information to customize the behavior of Sentry's server-side event processing.
 **/
type wasm = | @as("wasm") Wasm
type sourcemap = | @as("sourcemap") Sourcemap
type macho = | @as("macho") Macho
type wasmDebugImage = {
  @as("type") type_: wasm,
  debug_id: string,
  code_id?: Js.Nullable.t<string>,
  code_file: string,
  debug_file?: Js.Nullable.t<string>,
}

type sourceMapDebugImage = {
  @as("type") type_: sourcemap,
  code_file: string,
  debug_id: string,
}

type machoDebugImage = {
  @as("type") type_: macho,
  debug_id: string,
  image_addr: string,
  image_size?: float,
  code_file?: string,
}

type debugImage =
  | WasmDebugImage(wasmDebugImage)
  | SourceMapDebugImage(sourceMapDebugImage)
  | MachoDebugImage(machoDebugImage)

type debugMeta = {images?: array<debugImage>}
