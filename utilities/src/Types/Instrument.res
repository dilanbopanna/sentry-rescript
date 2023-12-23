type xhrSendInput = unknown

type consoleLevel = [
  | #debug
  | #info
  | #warn
  | #error
  | #log
  | #trace
  | @as("assert") #assert_
]

type sentryXhrData = {
  method: string,
  url: string,
  status_code?: float,
  body?: xhrSendInput,
  request_body_size?: float,
  response_body_size?: float,
  request_headers: Js.Dict.t<string>,
}

type sentryWrappedXMLHttpRequest = {
  __sentry_xhr_vs__?: sentryXhrData,
  __sentry_own_request__?: bool,
  // span id for the xhr request
  __sentry_xhr_span_id__?: string,
  setRequestHeader?: (string, string) => unit,
  getResponseHeader?: string => Js.Nullable.t<string>,
}

type handlerDataXhr = {
  /**
   * @deprecated This property will be removed in v8.
   */
  args: (string, string),
  xhr: sentryWrappedXMLHttpRequest,
  startTimestamp?: float,
  endTimestamp?: float,
}

type sentryFetchData = {
  method: string,
  url: string,
  request_body_size?: float,
  response_body_size?: float,
  // span_id for the fetch request
  __span?: string,
}

type response = {
  ok: bool,
  status: float,
  url: string,
  headers: Webfetchapi.webFetchHeaders,
}

type handlerDataFetch<'a> = {
  args: array<'a>,
  fetchData: sentryFetchData, // This data is among other things dumped directly onto the fetch breadcrumb data
  startTimestamp: float,
  endTimestamp?: float,
  // This is actually `Response` - Note: this type is not complete. Add to it if necessary.
  response?: response,
  error?: unknown,
}

type target = {target: Js.Json.t}
type event = Object(Js.Json.t) | Target(target)

type handlerDataDom = {
  // TODO: Replace `object` here with a vendored type for browser Events. We can't depend on the `DOM` or `react` TS types package here.
  event: event,
  name: string,
  global?: bool,
}

type handlerDataConsole<'a>  = {
  level: consoleLevel,
  args: array<'a>
}

type handlerDataHistory = {
  from: option<string>,
  to: string,
}

type msg = String(string) | Object(Js.Json.t)

type handlerDataError = {
  column?: float,
  error?: Js.Exn.t,
  line?: float,
  // TODO: Replace `object` here with a vendored type for browser Events. We can't depend on the `DOM` or `react` TS types package here.
  msg: msg,
  url?: string,
}
