type xHRSendInput<'a> = 'a

type consoleLevel = [#debug | #info | #warn | #error | #log | #"assert" | #trace]

type sentryXhrData<'a> = {
  method: string,
  url: string,
  status_code?: float,
  body?: xHRSendInput<'a>,
  request_body_size?: float,
  response_body_size?: float,
  request_headers: Js.Dict.t<string>,
}

type sentryWrappedXMLHttpRequest<'a> = {
  __sentry_xhr_v3__?: sentryXhrData<'a>,
  __sentry_own_request__?: bool,
  __sentry_xhr_span_id__?: string,
  setRequestHeader?: (~key: string, ~val: string) => unit,
  getResponseHeader?: string => Js.Nullable.t<string>,
}

type handlerDataXhr<'a> = {
  @deprecated("This property will be removed in v8")
  args: (string, string),
  xhr: sentryWrappedXMLHttpRequest<'a>,
  startTimestamp?: float,
  endTimestamp?: float,
}

type sentryFetchData = {
  method: string,
  url: string,
  request_body_size?: float,
  response_body_size?: float,
  __span?: string,
}
type response = {
  ok: bool,
  status: float,
  url: string,
  headers: Webfetchapi.webFetchHeaders,
}
type handlerDataFetch<'a, 'b> = {
  args: array<'a>,
  fetchData: sentryFetchData,
  startTimestamp: float,
  endTimestamp?: float,
  response?: response,
  error?: unknown,
}

type handlerDataDom = {
  event: Js.Json.t,
  name: string,
  global?: bool,
}

type handlerDataConsole<'a> = {
  level: consoleLevel,
  args: array<'a>,
}

type handlerDataHistory = {
  from: option<string>,
  to: string,
}

type handlerDataError = {
  column?: float,
  error?: Js.Exn.t,
  line?: float,
  msg: string,
  url?: string,
}

type handlerDataUnhandledRejection<'a> = 'a
