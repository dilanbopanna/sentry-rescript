type spanOriginType = [#manual | #auto]
type spanOriginCategory = string
type spanOriginIntegrationName = string
type spanOriginIntegrationPart = string
type spanOrigin = string

type spanContext = {
  /**
   * Description of the Span.
   */
  description?: string,
  /**
   * Human-readable identifier for the span. Alias for span.description.
   */
  name?: string,
  /**
   * Operation of the Span.
   */
  op?: string,
  /**
   * Completion status of the Span.
   * See: {@sentry/tracing SpanStatus} for possible values
   */
  status?: string,
  /**
   * Parent Span ID
   */
  parentSpanId?: string,
  /**
   * Was this span chosen to be sent as part of the sample?
   */
  sampled?: bool,
  /**
   * Span ID
   */
  spanId?: string,
  /**
   * Trace ID
   */
  traceId?: string,
  /**
   * Tags of the Span.
   */
  tags?: Js.Dict.t<Js.Json.t>,
  /**
   * Data of the Span.
   */
  data?: Js.Dict.t<Js.Json.t>,
  /**
   * Timestamp in seconds (epoch time) indicating when the span started.
   */
  startTimestamp?: float,
  /**
   * Timestamp in seconds (epoch time) indicating when the span ended.
   */
  endTimestamp?: float,
  /**
   * The instrumenter that created this span.
   */
  instrumenter?: Instrumenter.instrumenter,
  /**
   * The origin of the span, giving context about what created the span.
   */
  origin?: spanOrigin,
}

type traceContext = {
  data?: Js.Json.t,
  description?: string,
  op?: string,
  parent_span_id?: string,
  span_id: string,
  status?: string,
  tags?: Js.Json.t,
  trace_id: string,
}

type transaction

/** Span holding trace_id, span_id */
type span = {
  ...spanContext,
  /**
   * Human-readable identifier for the span. Identical to span.description.
   */
  name: string,
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
  tags: Js.Dict.t<Js.Json.t>,
  /**
   * @inheritDoc
   */
  data: Js.Dict.t<Js.Json.t>,
  /**
   * The transaction containing this span
   */
  transaction?: transaction, //TODO: Transation type
  /**
   * The instrumenter that created this span.
   */
  instrumenter: Instrumenter.instrumenter,
  /**
   * Sets the finish timestamp on the current span.
   * @param endTimestamp Takes an endTimestamp if the end should not be the time when you call this function.
   */
  finish: (~endTimestamp: float, unit) => unit,
  /**
   * End the current span.
   */
  end: (~endTimestamp: float, unit) => void,
  /**
   * Sets the tag attribute on the current span.
   *
   * Can also be used to unset a tag, by passing `undefined`.
   *
   * @param key Tag key
   * @param value Tag value
   */
  setTag: (~key: string, ~value: Js.Json.t) => Js.this,
  /**
   * Sets the data attribute on the current span
   * @param key Data key
   * @param value Data value
   */
  setData: (~key: string, ~value: Js.Json.t) => Js.this,
  /**
   * Sets the status attribute on the current span
   * See: {@sentry/tracing SpanStatus} for possible values
   * @param status http code used to set the status
   */
  setStatus: string => Js.this,
  /**
   * Sets the status attribute on the current span based on the http code
   * @param httpStatus http code used to set the status
   */
  setHttpStatus: float => Js.this,
  /**
   * Set the name of the span.
   */
  setName: string => unit,
  /**
   * Creates a new `Span` while setting the current `Span.id` as `parentSpanId`.
   * Also the `sampled` decision will be inherited.
   */
  startChild: (~spanContext: spanContext, unit) => span,
  /**
   * Determines whether span was successful (HTTP200)
   */
  isSuccess: unit => bool,
  /** Return a traceparent compatible header string */
  toTraceparent: unit => string,
  /** Returns the current span properties as a `SpanContext` */
  toContext: unit => spanContext,
  /** Updates the current span with a new `SpanContext` */
  updateWithContext: spanContext => Js.this,
  /** Convert the object to JSON for w. spans array info only */
  getTraceContext: unit => traceContext,
  /** Convert the object to JSON */
  toJSON: unit => Js.Json.t,
}
