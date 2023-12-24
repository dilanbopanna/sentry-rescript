/** JSDoc */
type exceptionType<'a> = {
    values?: array<Exception.exception_<'a>>,
  }
type transactionInfo = {
    soruce: Transaction.transactionSource
}
type thread<'a> = {
    values: array<Thread.thread<'a>>
}

type captureContext //TODO

/**
 * The type of an `Event`.
 * Note that `ErrorEvent`s do not have a type (hence its undefined),
 * while all other events are required to have one.
 */
type eventType = [ #transaction | #profile | #replay_event | #feedback ]
type levelType = Severity(Severity.severity) | SeverityLevel(Severity.severityLevel)
type event<'a>= {
  event_id?: string,
  message?: string,
  timestamp?: float,
  start_timestamp?: float,
  // eslint-disable-next-line deprecation/deprecation
  level?: levelType,
  platform?: string,
  logger?: string,
  server_name?: string,
  release?: string,
  dist?: string,
  environment?: string,
  sdk?: Sdkinfo.sdkInfo,
  request?: Request.request,
  transaction?: string,
  modules?: Js.Dict.t<string>,
  fingerprint?: array<string>,
  @as("exception") exception_ ?: exceptionType<'a>,
  breadcrumbs?: array<Breadcrumb.breadcrumb>,
  contexts?: Context.contexts,
  tags?: Js.Json.t,
  extra?: Extra.extras<'a>,
  user?: User.user,
  @as("type") type_?: eventType,
  spans?: array<Span.span>,
  measurements?: Measurement.measurements,
  debug_meta?: DebugMeta.debugMeta,
  // A place to stash data which is needed at some point in the SDK's event processing pipeline but which shouldn't get sent to Sentry
  sdkProcessingMetadata?: Js.Json.t,
  transaction_info?: transactionInfo,
  threads?:thread<'a>,
}



type errorEvent<'a> = {
  ...event<'a>,
  @as("type") errorType : option<'a>,
}
type transactionEvent<'a> = {
...event<'a>,
 @as("type") transactionType: eventType
}

/** JSDoc */
type eventHint<'a> = {
  event_id?: string,
  captureContext?: captureContext,
  mechanism?: option<Mechanism.mechanism>,
  syntheticException?: Js.Nullable.t<Js.Exn.t>,
  originalException?: unknown,
  attachments?:array<Attachment.attachment>,
  data?: 'a,
  integrations?: array<string>,
}