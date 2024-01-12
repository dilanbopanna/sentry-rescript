type context = Js.Dict.t<Js.Json.t>

type state = {
  @as("type") type_: string,
  value: Js.Dict.t<Js.Json.t>,
}

type stateContext = {state: state}

type appContext = {
  app_name?: string,
  app_start_time?: string,
  app_version?: string,
  app_identifier?: string,
  build_type?: string,
  app_memory?: float,
}

type deviceContext = {
  name?: string,
  family?: string,
  model?: string,
  model_id?: string,
  arch?: string,
  battery_level?: float,
  orientation?: string,
  manufacturer?: string,
  brand?: string,
  screen_resolution?: string,
  screen_height_pixels?: float,
  screen_width_pixels?: float,
  screen_density?: float,
  screen_dpi?: float,
  online?: bool,
  charging?: bool,
  low_memory?: bool,
  simulator?: bool,
  memory_size?: float,
  free_memory?: float,
  usable_memory?: float,
  storage_size?: float,
  free_storage?: float,
  external_storage_size?: float,
  external_free_storage?: float,
  boot_time?: string,
  processor_count?: float,
  cpu_description?: string,
  processor_frequency?: float,
  device_type?: string,
  battery_status?: string,
  device_unique_identifier?: string,
  supports_vibration?: bool,
  supports_accelerometer?: bool,
  supports_gyroscope?: bool,
  supports_audio?: bool,
  supports_location_service?: bool,
}

type osContext = {
  name?: string,
  version?: string,
  build?: string,
  kernel_version?: string,
}

type cultureContext = {
  calendar?: string,
  display_name?: string,
  locale?: string,
  is_24_hour_format?: bool,
  timezone?: string,
}

type responseContext = {
  @as("type") type_?: string,
  cookies?: Js.Dict.t<Js.Json.t>,
  headers?: Js.Json.t,
  status_code?: float,
  body_size?: float, // in bytes
}

type traceContext = {
  data?: Js.Dict.t<Js.Json.t>,
  description?: string,
  op?: string,
  parent_span_id?: string,
  span_id: string,
  status?: string,
  tags?: Js.Dict.t<Js.Json.t>,
  trace_id: string,
  origin?: string,
}
type cloudResourceContext = {
  @as("['cloud.provider']") cloudProvider?: string,
  @as("['cloud.account.id']") cloudAccountId?: string,
  @as("['cloud.region']") cloudRegion?: string,
  @as("['cloud.availability_zone']") cloudAvailabilityZone?: string,
  @as("['cloud.platform']") cloudPlatform?: string,
  @as("['host.id']") hostId?: string,
  @as("['host.type']") hostType?: string,
}
type contexts = {
  app?: appContext,
  device?: deviceContext,
  os?: osContext,
  culture?: cultureContext,
  response?: responseContext,
  trace?: traceContext,
  cloud_resource?: cloudResourceContext,
  state?: stateContext,
}
