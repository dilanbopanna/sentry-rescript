type transactionSource = [
  | #custom
  | #url
  | #route
  | #view
  | #component
  | #task
]
type dynamicSamplingContext
type transactionMetadata = {
  /** The sample rate used when sampling this transaction */
  sampleRate?: float,
  /**
   * The Dynamic Sampling Context of a transaction. If provided during transaction creation, its Dynamic Sampling
   * Context Will be frozen
   */
  dynamicSamplingContext?: option<dynamicSamplingContext>,
  /** For transactions tracing server-side request handling, the request being tracked. */
  request?: Polymorphics.polymorphicRequest,
  /** Compatibility shim for transitioning to the `RequestData` integration. The options passed to our Express request
   * handler controlling what request data is added to the event.
   * TODO (v8): This should go away
   */
  requestDataOptionsFromExpressHandler?: Js.Dict.t<unknown>,
  /** For transactions tracing server-side request handling, the path of the request being tracked. */
  /** TODO: If we rm -rf `instrumentServer`, this can go, too */
  requestPath?: string,
  /** Information on how a transaction name was generated. */
  source: transactionSource,
  /** Metadata for the transaction's spans, keyed by spanId */
  spanMetadata: Js.Json.t,
}

/**
 * Context data passed by the user when starting a transaction, to be used by the tracesSampler method.
 */
type customSamplingContext = {
    _additionalTypes: Js.Json.t
}
/**
 * Data pulled from a `sentry-trace` header
 */
type traceparentData = {
  parentSampled?: bool,
  parentSpanId?: string,
  traceId?: string
}

type transactionContext = {
  ...Span.spanContext,
  /**
   * If true, sets the end timestamp of the transaction to the highest timestamp of child spans, trimming
   * the duration of the transaction. This is useful to discard extra time in the transaction that is not
   * accounted for in child spans, like what happens in the idle transaction Tracing integration, where we finish the
   * transaction after a given "idle time" and we don't want this "idle time" to be part of the transaction.
   */
  trimEnd?: bool,
  /**
   * If this transaction has a parent, the parent's sampling decision
   */
  parentSampled?: bool,
  /**
   * Metadata associated with the transaction, for internal SDK use.
   */
  metadata?: option<transactionMetadata>,
}

type samplingContext = {
  ...customSamplingContext,
  /**
   * Context data with which transaction being sampled was created
   */
  transactionContext: transactionContext,
  /**
   * Sampling decision from the parent transaction, if any.
   */
  parentSampled?: bool,
  /**
   * Object representing the URL of the current page or worker script. Passed by default when using the `BrowserTracing`
   * integration.
   */
  location?: Misc.workerLocation,
  /**
   * Object representing the incoming request to a node server. Passed by default when using the TracingHandler.
   */
  request?: Misc.extractedNodeRequestData,
}

type transaction = {
  trimEnd?: bool,
  /**
   * If this transaction has a parent, the parent's sampling decision
   */
  parentSampled?: bool,

  /**
   * @inheritDoc
   */
  spanId: string,
  /**
   * @inheritDoc
   */
  traceId: string,
  /**
   * @inheritDoc
   */
  startTimestamp: float,
  /**
   * @inheritDoc
   */
  tags: Js.Json.t,
  /**
   * @inheritDoc
   */
  data: Js.Json.t,
  /**
   * Metadata about the transaction
   */
  metadata: transactionMetadata,
  /**
   * The instrumenter that created this transaction.
   */
  instrumenter: Instrumenter.instrumenter,
  /**
   * Set the name of the transaction
   */
  setName: (~name: string, ~source: transactionSource=?, unit) => unit,
  /**
   * Set the context of a transaction event
   */
  setContext: (~key: string, ~context: Context.context) => unit,
  /**
   * Set observed measurement for this transaction.
   *
   * @param name Name of the measurement
   * @param value Value of the measurement
   * @param unit Unit of the measurement. (Defaults to an empty string)
   */
  setMeasurement: (~name: string, ~value: float, ~unit: Measurement.measurementUnit) => unit,
  /** Returns the current transaction properties as a `TransactionContext` */
  toContext: unit => transactionContext,
  /** Updates the current transaction with a new `TransactionContext` */
  updateWithContext: (transactionContext) => unit,
  /**
   * Set metadata for this transaction.
   * @hidden
   */
  setMetadata: (option<transactionMetadata>) => unit,
  /** Return the current Dynamic Sampling Context of this transaction */
  getDynamicSamplingContext: unit => option<dynamicSamplingContext>,
}
