type breadcrumb = {
  @as("type") type_?: string,
  level?: [Severity.severityLevel],
  event_id?: string,
  category?: string,
  message?: string,
  data?: Js.Dict.t<Js.Json.t>,
  timestamp?: float,
}

type breadcrumbHint = Js.Dict.t<Js.Json.t>

type fetchBreadcrumbData = {
  method: string,
  url: string,
  status_code?: float,
  request_body_size?: float,
  response_body_size?: float,
}

type xhrBreadcrumbData = {
  method?: string,
  url?: string,
  status_code?: float,
  request_body_size?: float,
  response_body_size?: float,
}

type fetchBreadcrumbHint<'a, 'b, 'c> = {
  input: array<'a>,
  data?: 'b,
  response?: 'c,
  startTimestamp: float,
  endTimestamp: float,
}
type xhrBreadcrumbHint<'a, 'b> = {
  xhr: 'a,
  input: 'b,
  startTimestamp: float,
  endTimestamp: float,
}
