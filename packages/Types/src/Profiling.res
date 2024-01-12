type threadId = string
type frameId = float
type stackId = float

type threadCpuSample = {
  stack_id: stackId,
  thread_id: threadId,
  queue_address?: string,
  elapsed_since_start_ns: string,
}

type threadCpuStack = array<frameId>

type threadCpuFrame = {
  function?: string,
  file?: string,
  lineno?: float,
  colno?: float,
  abs_path?: string,
  platform?: string,
  instruction_addr?: string,
  @as("module") module_?: string,
  in_app?: bool,
}

type threadCpuProfile = {
  samples: array<threadCpuSample>,
  stacks: array<threadCpuStack>,
  frames: array<threadCpuFrame>,
  thread_metadata: Js.Dict.t<Js.Json.t>,
  queue_metadata?: Js.Dict.t<Js.Json.t>,
}

type os = {
  name: string,
  version: string,
  build_number?: string,
}

type runtime = {
  name: string,
  version: string,
}

type device = {
  architecture: string,
  is_emulator: bool,
  locale: string,
  manufacturer: string,
  model: string,
}

type debug_meta = {images: array<DebugMeta.debugImage>}

type transaction = {
  name: string,
  id: string,
  trace_id: string,
  active_thread_id: string,
}

type transactions = {
  name: string,
  id: string,
  trace_id: string,
  active_thread_id: string,
  relative_start_ns: string,
  relative_end_ns: string,
}

type measurements = {
  unit: Measurement.measurementUnit,
  values: array<Js.Json.t>,
}

type profile = {
  event_id: string,
  version: string,
  os: os,
  runtime: runtime,
  device: device,
  timestamp: string,
  release: string,
  environment: string,
  platform: string,
  profile: threadCpuProfile,
  debug_meta?: debug_meta,
  transaction?: transaction,
  transactions?: array<transactions>,
  measurements?: Js.Dict.t<measurements>,
}
