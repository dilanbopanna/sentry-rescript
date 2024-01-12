type scope

type mutableOptions = {drop: bool}

type options = {includeReplay?: bool}

type client<'a, 'b, 'c, 'd, 'e, 'f, 'g, 'h, 'i, 'j, 'k, 'l> = {
  ...Options.clientOptions<'l>,
  captureException: (
    ~exception_: 'g,
    ~hint: Event.eventHint<'a>=?,
    ~scope: scope=?,
    unit,
  ) => Js.Nullable.t<string>, //TODO  Scope.scope
  captureMessage: (
    ~message: string,
    ~level: Severity.severityLevel=?,
    ~hint: Event.eventHint<'a>=?,
    ~scope: scope=?,
    unit,
  ) => Js.Nullable.t<string>,
  captureEvent: (
    ~event: Event.event<'b>,
    ~hint: Event.eventHint<'a>=?,
    ~scope: scope=?,
    unit,
  ) => Js.Nullable.t<string>,
  captureSession?: Session.session => unit,
  captureCheckIn?: (
    ~checkIn: Checkin.checkIn,
    ~monitorConfig: Checkin.monitorConfig=?,
    ~scope: scope=?,
    unit,
  ) => string,
  getDsn: unit => Js.Nullable.t<Dsn.dsnComponents>,
  getOptions: unit => 'c,
  getSdkMetadata?: unit => Js.Nullable.t<Sdkmetadata.sdkMetadata>,
  getTransport: unit => Js.Nullable.t<Transport.transport>,
  close: (~timeout: float=?, unit) => Js.Promise.t<bool>,
  flush: (~timeout: float=?, unit) => Js.Promise.t<bool>,
  addEventProcessor?: Eventprocessor.eventProcessor<'b, 'a, 'd> => unit,
  getEventProcessors?: unit => array<Eventprocessor.eventProcessor<'b, 'a, 'd>>,
  getIntegration: 'e => Js.Nullable.t<'f>,
  addIntegration?: 'e => unit,
  setupIntegrations: (~forceInitialize: bool=?, unit) => unit,
  eventFromException: (
    ~exception_: 'g,
    ~hint: Event.eventHint<'a>=?,
    unit,
  ) => Js.Promise.t<Event.event<'b>>,
  /** Creates an {@link Event} from primitive inputs to `captureMessage`. */
  eventFromMessage: (
    ~message: string,
    // eslint-disable-next-line deprecation/deprecation
    ~level: Severity.severityLevel=?,
    ~hint: Event.eventHint<'a>=?,
    unit,
  ) => Js.Promise.t<Event.event<'b>>,
  sendEvent: (~event: Event.event<'b>, ~hint: Event.eventHint<'a>=?, unit) => unit,
  sendSession: 'h => unit,
  captureAggregateMetrics?: array<Metrics.metricBucketItem> => unit,
  on?: (
    ~hook: string,
    ~callback: (
      ~transaction: Transaction.transaction=?,
      ~envelope: Envelope.envelope<'i>,
      ~hint: 'j,
      ~event: Event.event<'b>=?,
      ~sendResponse: Transport.transportMakeRequestResponse=?,
      ~breadcrumb: Breadcrumb.breadcrumb=?,
      ~dsc: Envelope.dynamicSamplingContext=?,
      ~otelSpan: 'k=?,
      ~mutableOptions: mutableOptions=?,
      ~feedback: Feedback.feedbackEvent=?,
      ~options: options=?,
      unit,
    ) => unit,
  ) => unit,
  emit?: (
    ~hook: string,
    ~transaction: Transaction.transaction=?,
    ~envelope: Envelope.envelope<'i>,
    ~hint: 'j,
    ~event: Event.event<'b>=?,
    ~sendResponse: Transport.transportMakeRequestResponse=?,
    ~breadcrumb: Breadcrumb.breadcrumb=?,
    ~dsc: Envelope.dynamicSamplingContext=?,
    ~otelSpan: 'k=?,
    ~mutableOptions: mutableOptions=?,
    ~feedback: Feedback.feedbackEvent=?,
    ~options: options=?,
    unit,
  ) => unit,
}
