type transportRequest<'a> = {body: 'a}

type transportMakeRequestResponse = {
  statusCode?: float,
  headers?: Js.Json.t,
}

type event

type internalBaseTransportOptions = {
  bufferSize?: float,
  recordDroppedEvent: (
    ~reason: ClientReport.eventDropReason,
    ~dataCategory: DataCategory.dataCategory,
    ~event: event=?, //TODO event
    unit,
  ) => unit,
  textEncoder?: Textencoder.textEncoderInternal,
}

type baseTransportOptions = {
  ...internalBaseTransportOptions,
  url: string,
}
type envelope
type transport = {
  send: envelope => Js.Promise.t<transportMakeRequestResponse>, //TODO envelope
  flush: (~timeout: float=?, unit) => Js.Promise.t<bool>,
}

type transportRequestExecutor<'a> = transportRequest<'a> => Js.Promise.t<
  transportMakeRequestResponse,
>
