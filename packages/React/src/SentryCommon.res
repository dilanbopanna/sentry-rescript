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
external makeMultiplexedTransport: ('a => 'b, 'c) => 'a => 'b = "makeMultiplexedTransport"

@module("@sentry/react")
external makeMain: 'a => 'b = "makeMain"

@module("@sentry/react")
external makeFetchTransport: (
  ~options: 'a,
  ~nativeFetch: (~input: 'b, ~init: 'c=?) => Js.Promise.t<'d>=?,
) => 'e = "makeFetchTransport"

@module("@sentry/react")
external makeBrowserOfflineTransport: ('a => 'b) => 'a => 'b = "makeBrowserOfflineTransport"

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
external createReduxEnhancer: (~enhancerOptions: 'a=?) => 'b = "createReduxEnhancer"

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
