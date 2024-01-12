type withProfilerOptions = {
  name: string,
  disabled?: bool,
  includeRender?: bool,
  includeUpdates?: bool,
}

type useProfilerOptions = {
  disabled?: bool,
  hasRenderSpan?: bool,
}

type errorBoundaryProps<'a, 'b, 'c> = {
  children?: React.element,
  showDialog?: bool,
  dialogOptions?: 'a,
  fallback?: React.element,
  onError?: (~error: Js.Exn.t, ~componentStack: string, ~eventId: string) => unit,
  onMount?: unit => unit,
  onReset?: (
    ~error: Js.Nullable.t<Js.Exn.t>,
    ~componentStack: Js.Nullable.t<string>,
    ~eventId: Js.Nullable.t<string>,
  ) => unit,
  onUnmount?: (
    ~error: Js.Nullable.t<Js.Exn.t>,
    ~componentStack: Js.Nullable.t<string>,
    ~eventId: Js.Nullable.t<string>,
  ) => unit,
  beforeCapture?: (
    ~scope: 'b,
    ~error: Js.Nullable.t<Js.Exn.t>,
    ~componentStack: Js.Nullable.t<string>,
  ) => unit,
  componentStack?: 'c,
  error?: Js.Exn.t,
  eventId?: string,
}

type enhancerOptions<'a, 'b, 'c, 'd> = {
  attachReduxState?: bool,
  stateTransformer?: 'a => 'b,
  actionTransformer?: 'c => Js.Nullable.t<'c>,
  configureScopeWithState?: (~scope: 'd, ~state: 'a) => unit,
}

type rec route = {path?: string, childRoutes?: array<route>}

type matchProps = {location: Js.Json.t, routes: array<route>}

type parent = {path: string, url: string, params: Js.Json.t, isExact: bool}

type matchPath<'b> = (
  ~pathname: string,
  ~props: 'b,
  ~parent: Js.Nullable.t<parent>=?,
) => Js.Nullable.t<parent>

type renderProps = {routes?: array<route>}

type match = (
  ~props: matchProps=?,
  ~cb: (
    ~error: Js.Exn.t=?,
    ~_redirectLocation: Js.Json.t=?,
    ~renderProps: renderProps=?,
    unit,
  ) => unit,
) => unit

//=============================================Methods================================================

@module("@sentry/react")
external init: 'a => unit = "init"

@module("@sentry/react")
external withProfiler: (
  ~wrappedComponent: React.element,
  ~options: withProfilerOptions=?,
  unit,
) => React.component<'a> = "withProfiler"

@module("@sentry/react")
external useProfiler: (~name: string, ~options: useProfilerOptions=?, unit) => unit = "useProfiler"

@module("@sentry/react")
external withErrorBoundary: (
  ~wrappedComponent: React.element=?,
  ~errorBoundaryOptions: errorBoundaryProps<'a, 'b, 'c>=?,
  unit,
) => React.component<'a> = "withErrorBoundary"

@module("@sentry/react")
external createReduxEnhancer: enhancerOptions<'a, 'b, 'c, 'd> => 'e = "createReduxEnhancer"

@module("@sentry/react")
external reactRouterV3Instrumentation: (
  ~history: Js.Json.t=?,
  ~routes: array<route>=?,
  ~match: match=?,
  unit,
) => 'd = "reactRouterV3Instrumentation"

@module("@sentry/react")
external reactRouterV4Instrumentation: (
  ~history: Js.Json.t,
  ~routes: array<'a>=?,
  ~matchPath: matchPath<'b>=?,
  unit,
) => 'c = "reactRouterV4Instrumentation"

@module("@sentry/react")
external reactRouterV5Instrumentation: (
  ~history: Js.Json.t,
  ~routes: array<'a>=?,
  ~matchPath: matchPath<'b>=?,
  unit,
) => 'c = "reactRouterV5Instrumentation"

@module("@sentry/react")
external withSentryRouting: 'a => React.component<'b> = "withSentryRouting"

module Profiler = {
  type profilerProps = {
    name: string,
    disabled?: bool,
    includeRender?: bool,
    includeUpdates?: bool,
    children?: React.element,
    updateProps: Js.Dict.t<Js.Json.t>,
  }

  @module("@sentry/react")
  external make: React.component<profilerProps> = "Profiler"
}

module ErrorBoundary = {
  @module("@sentry/react")
  external make: React.component<errorBoundaryProps<'a, 'b, 'c>> = "ErrorBoundary"
}

//===================================Common============================================

@module("@sentry/react")
external wrap: (unit => unit) => 'a = "wrap"

@module("@sentry/react")
external withScope: ('a => unit) => 'b = "withScope"

@module("@sentry/react")
external startTransaction: (~context: 'a, ~customSamplingContext: 'b=?) => 'c = "startTransaction"

@module("@sentry/react")
external spanStatusfromHttpCode: float => 'a = "spanStatusfromHttpCode"

@module("@sentry/react")
external showReportDialog: (~options: 'a=?, ~hub: 'b=?) => unit = "showReportDialog"

@module("@sentry/react")
external setUser: 'a => 'b = "setUser"

@module("@sentry/react")
external setTags: 'a => 'b = "setTags"

@module("@sentry/react")
external setTag: (string, 'a) => 'b = "setTag"

@module("@sentry/react")
external setExtras: 'a => 'b = "setExtras"

@module("@sentry/react")
external setExtra: (string, 'a) => 'b = "setExtra"

@module("@sentry/react")
external setContext: (string, 'a) => 'b = "setContext"

@module("@sentry/react")
external onProfilingStartRouteTransaction: Js.Undefined.t<'a> => Js.Undefined.t<'a> =
  "onProfilingStartRouteTransaction"

@module("@sentry/react")
external makeXHRTransport: 'a => 'b = "makeXHRTransport"

@module("@sentry/react")
external makeMultiplexedTransport: ('a => 'b, 'c, 'a) => 'b = "makeMultiplexedTransport"

@module("@sentry/react")
external makeMain: 'a => 'b = "makeMain"

@module("@sentry/react")
external makeFetchTransport: (
  ~options: 'a,
  ~nativeFetch: (~input: 'b, ~init: 'c=?) => Js.Promise.t<'d>=?,
) => 'e = "makeFetchTransport"

@module("@sentry/react")
external makeBrowserOfflineTransport: ('a => 'b, 'a) => 'b = "makeBrowserOfflineTransport"

@module("@sentry/react")
external lastEventId: unit => Js.Undefined.t<string> = "lastEventId"

@module("@sentry/react")
external instrumentOutgoingRequests: (~_options: 'a=?) => unit = "instrumentOutgoingRequests"

@module("@sentry/react")
external getCurrentHub: unit => 'a = "getCurrentHub"

@module("@sentry/react")
external getActiveTransaction: (~maybeHub: 'a=?) => Js.Undefined.t<'b> = "getActiveTransaction"

@module("@sentry/react")
external flush: (~timeout: float=?) => Js.Promise.t<'b> = "flush"

@module("@sentry/react")
external extractTraceparentData: (~traceparent: string=?) => Js.Promise.t<'a> =
  "extractTraceparentData"

@module("@sentry/react")
external createUserFeedbackEnvelope: (~feedback: 'a, ~__namedParameters: 'b) => 'c =
  "createUserFeedbackEnvelope"

@module("@sentry/react")
external createTransport: (~options: 'a, ~makeRequest: 'b, ~buffer: 'c=?) => 'd = "createTransport"

@module("@sentry/react")
external configureScope: ('a => unit) => 'b = "configureScope"

@module("@sentry/react")
external close: (~timeout: float=?) => Js.Promise.t<'b> = "close"

@module("@sentry/react")
external captureUserFeedback: 'feedback => unit = "captureUserFeedback"

@module("@sentry/react")
external captureMessage: (~message: string, ~captureContext: 'a=?) => 'b = "captureMessage"

@module("@sentry/react")
external captureException: (~_exception: 'a, ~captureContext: 'b=?) => 'c = "captureException"

@module("@sentry/react")
external captureEvent: (~event: 'event, ~hint: 'hint=?) => 'a = "captureEvent"

@module("@sentry/react")
external addTracingExtensions: unit => unit = "addTracingExtensions"

@module("@sentry/react")
external addGlobalEventProcessor: 'a => unit = "addGlobalEventProcessor"

@module("@sentry/react")
external addBreadcrumb: 'breadcrumb => 'a = "addBreadcrumb"

@module("@sentry/react") @new external scope: unit => 'a = "Scope"

@module("@sentry/react") @new
external hub: (~client: 'a=?, ~scope: 'b=?, ~_version: 'c=?) => 'd = "Hub"
