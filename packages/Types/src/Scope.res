type captureContext // TODO

type scopeContext<'a>= {
  user: User.user,
  // eslint-disable-next-line deprecation/deprecation
  level: Severity.severityLevel,
  extra: Extra.extras<'a>,
  contexts: Context.contexts,
  tags: Js.Dict.t<string>,
  fingerprint: array<string>,
  requestSession: Session.requestSession,
  propagationContext: Tracing.propagationContext,
}

type scopeData<'a, 'b, 'c> = {
  eventProcessors: array<Eventprocessor.eventProcessor<'a,'b,'c>>,
  breadcrumbs: array<Breadcrumb.breadcrumb>,
  user: User.user,
  tags: Js.Dict.t<string>,
  extra: Extra.extras<'a>,
  contexts: Context.contexts,
  attachments: array<Attachment.attachment>,
  propagationContext: Tracing.propagationContext,
  sdkProcessingMetadata: Js.Dict.t<string>,
  fingerprint: array<string>,
  level?: Severity.severityLevel,
  transactionName?: string,
  span?: Span.span,
}

/**
 * Holds additional event information. {@link Scope.applyToEvent} will be called by the client before an event is sent.
 */
type scope<'a, 'b, 'c> = {
  /** Add new event processor that will be called after {@link applyToEvent}. */
  addEventProcessor: (~callback: Eventprocessor.eventProcessor<'a, 'b, 'c>) => @this 'a,

  /** Get the data of this scope, which is applied to an event during processing. */
  getScopeData: () => scopeData<'a, 'b, 'c>,

  /**
   * Updates user context information for future events.
   *
   * @param user User context object to be set in the current context. Pass `null` to unset the user.
   */
  setUser: (~user: Js.Nullable.t<User.user>)=> @this 'a,

  /**
   * Returns the `User` if there is one
   */
  getUser: ()=> option<User.user>,

  /**
   * Set an object that will be merged sent as tags data with the event.
   * @param tags Tags context object to merge into current context.
   */
  setTags: (~tags: Js.Dict.t<string>)=> @this 'a,

  /**
   * Set key:value that will be sent as tags data with the event.
   *
   * Can also be used to unset a tag by passing `undefined`.
   *
   * @param key String key of tag
   * @param value Value of tag
   */
  setTag: (~key: string, ~value: 'a)=> @this 'a,

  /**
   * Set an object that will be merged sent as extra data with the event.
   * @param extras Extras object to merge into current context.
   */
  setExtras: (~extras: Extra.extra<'a>)=> @this 'a,

  /**
   * Set key:value that will be sent as extra data with the event.
   * @param key String of extra
   * @param extra Any kind of data. This data will be normalized.
   */
  setExtra: (~key: string, ~extra: Extra.extra<'a>)=> @this 'a,

  /**
   * Sets the fingerprint on the scope to send with the events.
   * @param fingerprint string[] to group events in Sentry.
   */
  setFingerprint: (~fingerprint: array<string>)=> @this 'a,

  /**
   * Sets the level on the scope for future events.
   * @param level string {@link SeverityLevel}
   */
  setLevel:(
    // eslint-disable-next-line deprecation/deprecation
    ~level: Severity.severityLevel,
  )=> @this 'a,

  /**
   * Sets the transaction name on the scope for future events.
   */
  setTransactionName: (~name: string=?) => @this 'a,

  /**
   * Sets context data with the given name.
   * @param name of the context
   * @param context an object containing context data. This data will be normalized. Pass `null` to unset the context.
   */
  setContext: (~name: string, ~context: Js.Nullable.t<Context.context>)=> @this 'a,

  /**
   * Sets the Span on the scope.
   * @param span Span
   */
  setSpan: (~span: Span.span=?, ())=> @this 'a,

  /**
   * Returns the `Span` if there is one
   */
  getSpan: ()=> option<Span.span> ,

  /**
   * Returns the `Transaction` attached to the scope (if there is one)
   */
  getTransaction: ()=> option<Transaction.transaction>,

  /**
   * Returns the `Session` if there is one
   */
  getSession: ()=> option<Session.session>,

  /**
   * Sets the `Session` on the scope
   */
  setSession: (~session: Session.session=?)=>@this 'a,

  /**
   * Returns the `RequestSession` if there is one
   */
  getRequestSession: ()=>option<Session.requestSession>,

  /**
   * Sets the `RequestSession` on the scope
   */
  setRequestSession: (~requestSession: Session.requestSession=?)=> @this 'a,

  /**
   * Updates the scope with provided data. Can work in three variations:
   * - plain object containing updatable attributes
   * - Scope instance that'll extract the attributes from
   * - callback function that'll receive the current scope as an argument and allow for modifications
   * @param captureContext scope modifier to be used
   */
  update: (~captureContext: captureContext)=> @this 'a,

  /** Clears the current scope and resets its properties. */
  clear: ()=> @this 'a,

  /**
   * Sets the breadcrumbs in the scope
   * @param breadcrumbs Breadcrumb
   * @param maxBreadcrumbs number of max breadcrumbs to merged into event.
   */
  addBreadcrumb: (~breadcrumb: Breadcrumb.breadcrumb, ~maxBreadcrumbs: float=?)=>@this 'a,

  /**
   * Get the last breadcrumb.
   */
  getLastBreadcrumb: ()=> option<Breadcrumb.breadcrumb>,

  /**
   * Clears all currently set Breadcrumbs.
   */
  clearBreadcrumbs: ()=> @this 'a,

  /**
   * Adds an attachment to the scope
   * @param attachment Attachment options
   */
  addAttachment: (~attachment: Attachment.attachment)=> @this 'a,

  /**
   * Returns an array of attachments on the scope
   */
  getAttachments: ()=> array<Attachment.attachment>,

  /**
   * Clears attachments from the scope
   */
  clearAttachments: ()=> @this 'a,

  /**
   * Add data which will be accessible during event processing but won't get sent to Sentry
   */
  setSDKProcessingMetadata: (~newData: Js.Dict.t<string>)=> @this 'a,

  /**
   * Add propagation context to the scope, used for distributed tracing
   */
  setPropagationContext:(~context: Tracing.propagationContext)=> @this 'a,

  /**
   * Get propagation context from the scope, used for distributed tracing
   */
  getPropagationContext:()=> Tracing.propagationContext,
}