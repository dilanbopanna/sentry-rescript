type integration
type captureContext
type tracePropagationTargets
type errorEvent
type eventHint
type event
type samplingContext
type transactionEvent

type clientOptions<'a> = {
  ...Transport.baseTransportOptions,
  debug?: bool,
  enabled?: bool,
  attachStacktrace?: bool,
  autoSessionTracking?: bool,
  sendClientReports?: bool,
  dsn?: string,
  release?: string,
  environment?: string,
  dist?: string,
  instrumenter?: Instrumenter.instrumenter,
  transportOptions?: option<'a>,
  tracesSampleRate?: float,
  enableTracing?: bool,
  initialScope?: captureContext, //TODO Scope.captureContext
  maxBreadcrumbs?: float,
  sampleRate?: float,
  maxValueLength?: float,
  normalizeDepth?: float,
  normalizeMaxBreadth?: float,
  shutdownTimeout?: float,
  ignoreErrors?: array<string>,
  ignoreTransactions?: array<string>,
  tunnel?: string,
  sendDefaultPii?: bool,
  _metadata?: Sdkmetadata.sdkMetadata,
  _experiments?: Js.Json.t,
  allowUrls?: array<string>,
  denyUrls?: array<string>,
  tracePropagationTargets?: tracePropagationTargets, //TODO Tracing.tracePropagationTargets
  tracesSampler?: samplingContext => bool, //TODO Tracing.samplingContext
  beforeSend?: (~event: errorEvent, ~hint: eventHint) => Js.Nullable.t<Js.Promise.t<option<event>>>, //TODO Event.errorevnt, event, eventHint
  beforeSendTransaction?: (
    ~event: transactionEvent,
    ~hint: eventHint,
  ) => Js.Nullable.t<Js.Promise.t<option<event>>>, //TODO Event.transactionEvent event, eventHint
  beforeBreadcrumb?: (
    ~breadcrumb: Breadcrumb.breadcrumb,
    ~hint: Breadcrumb.breadcrumbHint=?,
    unit,
  ) => Js.Nullable.t<Breadcrumb.breadcrumb>,
}

type options<'a, 'b, 'c, 'd, 'e> = {
  ...clientOptions<'a>,
  defaultIntegrations?: 'b,
  integrations?: 'c, //TODO Integration.integration
  transport?: 'd => Transport.transport,
  stackParser?: 'e,
}
