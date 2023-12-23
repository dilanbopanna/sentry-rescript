type extractedNodeRequestData = {
  /** Allows any additional fields with any value */
  _additinalFields: Js.Dict.t<Js.Json.t>,
  /** Specific headers from the request */
  headers?: Js.Dict.t<string>,
  /**  The request's method */
  method?: string,
  /** The request's URL, including query string */
  url?: string,
  /** String representing the cookies sent along with the request */
  cookies?: Js.Dict.t<string>,
  /** The request's query params */
  query_string?: Request.queryParams,
  /** Any data sent in the request's body, as a JSON string */
  data?: string,
}

type workerLocation = {
  /** The protocol scheme of the URL of the script executed in the Worker, including the final ':'. */
  protocol: string,
  /** The host, that is the hostname, a ':', and the port of the URL of the script executed in the Worker. */
  host: string,
  /** The domain of the URL of the script executed in the Worker. */
  hostname: string,
  /** The canonical form of the origin of the specific location. */
  origin: string,
  /** The port number of the URL of the script executed in the Worker. */
  port: string,
  /** The path of the URL of the script executed in the Worker, beginning with a '/'. */
  pathname: string,
  /** The parameters (query string) of the URL of the script executed in the Worker, beginning with a '?'. */
  search: string,
  /** The fragment identifier of the URL of the script executed in the Worker, beginning with a '#'. */
  hash: string,
  /** Stringifier that returns the whole URL of the script executed in the Worker. */
  href: string,
  /** Synonym for `href` attribute */
  toString: unit => string,
}

type primitive<'a> =
  | Undefined(option<'a>)
  | Null(Js.Nullable.t<'a>)
  | Boolean(bool)
  | BigInt(int)
  | Number(float)
  | String(string)
  | Symbol(string)


type httpHeaderValue<'a> =
  | String(string)
  | ArrayString(array<string>)
  | Number(float)
  | Null(Js.Nullable.t<'a>)
