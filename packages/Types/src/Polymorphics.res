type baseRequest = {
  method?: string,
  url?: string,
}

type polymorphicEvent<'a, 'b> = {
  @as("type") type_: string,
  target?: 'a,
  currentTarget?: 'b,
}

type browserRequest = baseRequest

type socket = {
  encrypted?: bool,
  remoteAddress?: string,
}

type nodeRequest = {
  ...baseRequest,
  headers?: Js.Dict.t<Js.Json.t>,
  protocol?: string,
  socket?: socket,
}

type koaRequest = {
  ...nodeRequest,
  host?: string,
  hostname?: string,
  ip?: string,
  originalUrl?: string,
}

type nextjsRequest = {
  ...nodeRequest,
  cookies?: Js.Dict.t<Js.Json.t>,
  query?: Js.Dict.t<Js.Json.t>,
}

type stack = {name: string}

type route = {
  path: string,
  stack: array<stack>,
}

type expressRequest = {
  ...nodeRequest,
  baseUrl?: string,
  body?: Js.Dict.t<Js.Json.t>,
  host?: string,
  hostname?: string,
  ip?: string,
  originalUrl?: string,
  route?: route,
  query?: Js.Dict.t<Js.Json.t>,
  user?: Js.Dict.t<Js.Json.t>,
  _reconstructedRoute?: string,
}

type polymorphicRequest = {
  ...expressRequest,
}
