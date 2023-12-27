type client
type scope

type rec hub<'t, 'a, 'b, 'c, 'd, 'e, 'f, 'g, 'i> = {
  isOlderThan: float => bool,
  bindClient: client => unit, //TODO Client.client
  @deprecated("Use `withScope` instead.")
  pushScope: unit => scope, //TODO  Scope.scope
  @deprecated("Use `withScope` instead.")
  popScope: unit => bool,
  withScope: (scope => 't) => 't,
  getClient: unit => Js.Nullable.t<client>,
  getScope: unit => scope,
  getIsolationScope: unit => scope,
  captureException: (
    @as("exception") ~exception_: 'b,
    ~hint: Event.eventHint<'a>=?,
    unit,
  ) => string,
  captureMessage: (
    ~message: string,
    ~level: Severity.severityLevel=?,
    ~hint: Event.eventHint<'a>=?,
    unit,
  ) => string,
  captureEvent: (~event: Event.event<'c>, ~hint: Event.eventHint<'a>=?, unit) => string,
  lastEventId: unit => Js.Nullable.t<string>,
  addBreadcrumb: (
    ~breadcrumb: Breadcrumb.breadcrumb,
    ~hint: Breadcrumb.breadcrumbHint=?,
    unit,
  ) => unit,
  setUser: Js.Nullable.t<User.user> => unit,
  setTags: Js.Json.t => unit,
  setTag: (string, Misc.primitive<'i>) => unit,
  setExtra: (string, Extra.extra<'d>) => unit,
  setExtras: Extra.extra<'e> => unit,
  setContext: (string, Js.Nullable.t<Js.Json.t>) => unit,
  @deprecated("Use `getScope()` directly.")
  configureScope: (scope => unit) => unit,
  run: (hub<'t, 'a, 'b, 'c, 'd, 'e, 'f, 'g, 'i> => unit) => unit,
  getIntegration: (~integration: 'f) => Js.Nullable.t<'g>,
  traceHeaders: unit => Js.Json.t,
  startTransaction: (
    ~context: Transaction.transactionContext,
    ~customSamplingContext: Transaction.customSamplingContext=?,
  ) => Transaction.transaction,
  startSession: Session.session => Session.session,
  endSession: unit => unit,
  captureSession: bool => unit,
  shouldSendDefaultPii: unit => bool,
}
